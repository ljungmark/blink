#ifndef BLINK_MACROS_H_
#define BLINK_MACROS_H_

#define ROUNDDOWN(X, K) ((X) & -(K))
#define ROUNDUP(X, K)   (((X) + (K)-1) & -(K))
#define IS2POW(X)       (!((X) & ((X)-1)))
#define ABS(X)          ((X) >= 0 ? (X) : -(X))
#define MIN(X, Y)       ((Y) > (X) ? (X) : (Y))
#define MAX(X, Y)       ((Y) < (X) ? (X) : (Y))
#define ARRAYLEN(A) \
  ((long)((sizeof(A) / sizeof(*(A))) / ((unsigned)!(sizeof(A) % sizeof(*(A))))))

#endif /* BLINK_MACROS_H_ */
