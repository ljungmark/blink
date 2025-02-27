/*-*- mode:c;indent-tabs-mode:nil;c-basic-offset:2;tab-width:8;coding:utf-8 -*-│
│vi: set net ft=c ts=2 sts=2 sw=2 fenc=utf-8                                :vi│
╞══════════════════════════════════════════════════════════════════════════════╡
│ Copyright 2022 Justine Alexandra Roberts Tunney                              │
│                                                                              │
│ Permission to use, copy, modify, and/or distribute this software for         │
│ any purpose with or without fee is hereby granted, provided that the         │
│ above copyright notice and this permission notice appear in all copies.      │
│                                                                              │
│ THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL                │
│ WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED                │
│ WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE             │
│ AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL         │
│ DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR        │
│ PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER               │
│ TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR             │
│ PERFORMANCE OF THIS SOFTWARE.                                                │
╚─────────────────────────────────────────────────────────────────────────────*/
#include <poll.h>
#include <sys/uio.h>

#include "blink/debug.h"
#include "blink/machine.h"
#include "blink/syscall.h"
#include "blink/uart.h"

static int OpE9Read(struct Machine *m) {
  u8 b;
  struct Fd *fd;
  struct iovec t = {&b, 1};
  if (!(fd = GetAndLockFd(m, 0))) return -1;
  if (IB(fd->cb->readv)(fd->systemfd, &t, 1) == 1) {
    return b;
  } else {
    return -1;
  }
}

static int OpE9Write(struct Machine *m, u8 b) {
  int rc;
  struct Fd *fd;
  struct iovec t = {&b, 1};
  if (!(fd = GetAndLockFd(m, 1))) return -1;
  rc = IB(fd->cb->writev)(fd->systemfd, &t, 1);
  UnlockFd(fd);
  return rc;
}

static int OpE9Poll(struct Machine *m) {
  int rc;
  struct Fd *fd;
  struct pollfd pf;
  if (!(fd = GetAndLockFd(m, 0))) return -1;
  pf.fd = fd->systemfd;
  pf.events = POLLIN | POLLOUT;
  rc = IB(fd->cb->poll)(&pf, 1, 20);
  if (rc > 0) rc = pf.revents;
  UnlockFd(fd);
  return rc;
}

static int OpSerialIn(struct Machine *m, int r) {
  int p, s;
  switch (r) {
    case UART_DLL:
      if (!m->system->dlab) {
        return OpE9Read(m);
      } else {
        return 0x01;
      }
    case UART_LSR:
      if ((p = OpE9Poll(m)) == -1) return -1;
      s = UART_TTYIDL;
      if (p & POLLIN) s |= UART_TTYDA;
      if (p & POLLOUT) s |= UART_TTYTXR;
      return s;
    default:
      return 0;
  }
}

static int OpSerialOut(struct Machine *m, int r, u32 x) {
  switch (r) {
    case UART_DLL:
      if (!m->system->dlab) {
        return OpE9Write(m, x);
      }
      return 0;
    case UART_LCR:
      m->system->dlab = !!(x & UART_DLAB);
      return 0;
    default:
      return -1;
  }
}

u64 OpIn(struct Machine *m, u16 p) {
  switch (p) {
    case 0xE9:
      return OpE9Read(m);
    case 0x3F8 ... 0x3FF:
      return OpSerialIn(m, p - 0x3F8);
    default:
      return -1;
  }
}

int OpOut(struct Machine *m, u16 p, u32 x) {
  switch (p) {
    case 0xE9:
      return OpE9Write(m, x);
    case 0x3F8 ... 0x3FF:
      return OpSerialOut(m, p - 0x3F8, x);
    default:
      return -1;
  }
}
