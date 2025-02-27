#-*-mode:makefile-gmake;indent-tabs-mode:t;tab-width:8;coding:utf-8-*-┐
#───vi: set et ft=make ts=8 tw=8 fenc=utf-8 :vi───────────────────────┘

.PRECIOUS: third_party/cosmo/%.gz
third_party/cosmo/%.gz: third_party/cosmo/%.gz.sha256
	curl -so $@ https://justine.lol/cosmotests/$(notdir $@)
	$(VM) build/bootstrap/sha256sum.com $<

.PRECIOUS: third_party/cosmo/%.com.dbg
third_party/cosmo/%.com.dbg: third_party/cosmo/%.com.dbg.gz
	gzip -dc <$< >$@
	chmod +x $@

.PRECIOUS: third_party/cosmo/%.com
third_party/cosmo/%.com: third_party/cosmo/%.com.gz third_party/cosmo/%.com.dbg
	gzip -dc <$< >$@
	chmod +x $@

o/$(MODE)/third_party/cosmo/%.com.ok: third_party/cosmo/%.com o/$(MODE)/blink/blink
	@mkdir -p $(@D)
	o/$(MODE)/blink/blink $<
	@touch $@

o/$(MODE)/third_party/cosmo:									\
		o/$(MODE)/third_party/cosmo/intrin_test.com.ok					\
		o/$(MODE)/third_party/cosmo/lockscale_test.com.ok				\
		o/$(MODE)/third_party/cosmo/palignr_test.com.ok					\
		o/$(MODE)/third_party/cosmo/pmulhrsw_test.com.ok				\
		o/$(MODE)/third_party/cosmo/mulaw_test.com.ok					\
		o/$(MODE)/third_party/cosmo/nanosleep_test.com.ok				\
		o/$(MODE)/third_party/cosmo/clock_nanosleep_test.com.ok				\
		o/$(MODE)/third_party/cosmo/palandprintf_test.com.ok				\
		o/$(MODE)/third_party/cosmo/pshuf_test.com.ok					\
		o/$(MODE)/third_party/cosmo/popcnt_test.com.ok					\
		o/$(MODE)/third_party/cosmo/kprintf_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memmem_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memcmp_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memory_test.com.ok					\
		o/$(MODE)/third_party/cosmo/memrchr_test.com.ok					\
		o/$(MODE)/third_party/cosmo/parsecidr_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parsecontentlength_test.com.ok			\
		o/$(MODE)/third_party/cosmo/parseforwarded_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parsehoststxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parsehttpdatetime_test.com.ok			\
		o/$(MODE)/third_party/cosmo/parsehttpmessage_test.com.ok			\
		o/$(MODE)/third_party/cosmo/parsehttprange_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parseip_test.com.ok					\
		o/$(MODE)/third_party/cosmo/parseresolvconf_test.com.ok				\
		o/$(MODE)/third_party/cosmo/parseurl_test.com.ok				\
		o/$(MODE)/third_party/cosmo/pascalifydnsname_test.com.ok			\
		o/$(MODE)/third_party/cosmo/pcmpstr_test.com.ok					\
		o/$(MODE)/third_party/cosmo/pingpong_test.com.ok				\
		o/$(MODE)/third_party/cosmo/prototxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/rand64_test.com.ok					\
		o/$(MODE)/third_party/cosmo/qsort_test.com.ok					\
		o/$(MODE)/third_party/cosmo/readansi_test.com.ok				\
		o/$(MODE)/third_party/cosmo/regex_test.com.ok					\
		o/$(MODE)/third_party/cosmo/renameat_test.com.ok				\
		o/$(MODE)/third_party/cosmo/atoi_test.com.ok					\
		o/$(MODE)/third_party/cosmo/resolvehostsreverse_test.com.ok			\
		o/$(MODE)/third_party/cosmo/resolvehoststxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/reverse_test.com.ok					\
		o/$(MODE)/third_party/cosmo/rgb2ansi_test.com.ok				\
		o/$(MODE)/third_party/cosmo/rngset_test.com.ok					\
		o/$(MODE)/third_party/cosmo/round_test.com.ok					\
		o/$(MODE)/third_party/cosmo/roundup2log_test.com.ok				\
		o/$(MODE)/third_party/cosmo/sad16x8n_test.com.ok				\
		o/$(MODE)/third_party/cosmo/scalevolume_test.com.ok				\
		o/$(MODE)/third_party/cosmo/secp384r1_test.com.ok				\
		o/$(MODE)/third_party/cosmo/putenv_test.com.ok					\
		o/$(MODE)/third_party/cosmo/note_test.com.ok					\
		o/$(MODE)/third_party/cosmo/once_test.com.ok					\
		o/$(MODE)/third_party/cosmo/mu_test.com.ok					\
		o/$(MODE)/third_party/cosmo/servicestxt_test.com.ok				\
		o/$(MODE)/third_party/cosmo/setitimer_test.com.ok				\
		o/$(MODE)/third_party/cosmo/setlocale_test.com.ok				\
		o/$(MODE)/third_party/cosmo/sincos_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sinh_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sizetol_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sleb128_test.com.ok					\
		o/$(MODE)/third_party/cosmo/snprintf_test.com.ok				\
		o/$(MODE)/third_party/cosmo/alu_test.com.ok					\
		o/$(MODE)/third_party/cosmo/bsu_test.com.ok					\
		o/$(MODE)/third_party/cosmo/divmul_test.com.ok					\
		o/$(MODE)/third_party/cosmo/test_suite_ecp.com.ok				\
		o/$(MODE)/third_party/cosmo/dll_test.com.ok					\
		o/$(MODE)/third_party/cosmo/asmdown_test.com.ok					\
		o/$(MODE)/third_party/cosmo/asin_test.com.ok					\
		o/$(MODE)/third_party/cosmo/atan2_test.com.ok					\
		o/$(MODE)/third_party/cosmo/argon2_test.com.ok					\
		o/$(MODE)/third_party/cosmo/counter_test.com.ok					\
		o/$(MODE)/third_party/cosmo/pthread_exit_test.com.ok				\
		o/$(MODE)/third_party/cosmo/pthread_create_test.com.ok				\
		o/$(MODE)/third_party/cosmo/pthread_detach_test.com.ok				\
		o/$(MODE)/third_party/cosmo/pthread_mutex_lock_test.com.ok			\
		o/$(MODE)/third_party/cosmo/pthread_mutex_lock2_test.com.ok			\
		o/$(MODE)/third_party/cosmo/pthread_spin_lock_test.com.ok			\
		o/$(MODE)/third_party/cosmo/cescapec_test.com.ok				\
		o/$(MODE)/third_party/cosmo/clock_gettime_test.com.ok				\
		o/$(MODE)/third_party/cosmo/cas_test.com.ok					\
		o/$(MODE)/third_party/cosmo/bilinearscale_test.com.ok				\
		o/$(MODE)/third_party/cosmo/access_test.com.ok					\
		o/$(MODE)/third_party/cosmo/a64l_test.com.ok					\
		o/$(MODE)/third_party/cosmo/_timespec_test.com.ok				\
		o/$(MODE)/third_party/cosmo/zleb64_test.com.ok					\
		o/$(MODE)/third_party/cosmo/xslurp_test.com.ok					\
		o/$(MODE)/third_party/cosmo/chdir_test.com.ok					\
		o/$(MODE)/third_party/cosmo/mkdir_test.com.ok					\
		o/$(MODE)/third_party/cosmo/unlinkat_test.com.ok				\
		o/$(MODE)/third_party/cosmo/makedirs_test.com.ok				\
		o/$(MODE)/third_party/cosmo/dirstream_test.com.ok				\
		o/$(MODE)/third_party/cosmo/bitscan_test.com.ok					\
		o/$(MODE)/third_party/cosmo/commandv_test.com.ok				\
		o/$(MODE)/third_party/cosmo/closefrom_test.com.ok				\
		o/$(MODE)/third_party/cosmo/ecvt_test.com.ok					\
		o/$(MODE)/third_party/cosmo/division_test.com.ok				\
		o/$(MODE)/third_party/cosmo/test_suite_aes.cbc.com.ok				\
		o/$(MODE)/third_party/cosmo/test_suite_cipher.gcm.com.ok			\
		o/$(MODE)/third_party/cosmo/test_suite_ctr_drbg.com.ok				\
		o/$(MODE)/third_party/cosmo/test_suite_entropy.com.ok				\
		o/$(MODE)/third_party/cosmo/test_suite_mpi.com.ok				\
		o/$(MODE)/third_party/cosmo/test_suite_md.com.ok				\
		o/$(MODE)/third_party/cosmo/crc32_test.com.ok					\
		o/$(MODE)/third_party/cosmo/lock2_test.com.ok					\
		o/$(MODE)/third_party/cosmo/lock_test.com.ok					\
		o/$(MODE)/third_party/cosmo/sigaction_test.com.ok				\
		o/$(MODE)/third_party/cosmo/sigsetjmp_test.com.ok				\
		o/$(MODE)/third_party/cosmo/sigsuspend_test.com.ok				\
		o/$(MODE)/third_party/cosmo/escapehtml_test.com.ok				\
		o/$(MODE)/third_party/cosmo/escapeurlparam_test.com.ok				\
		o/$(MODE)/third_party/cosmo/escapejsstringliteral_test.com.ok			\
		o/$(MODE)/third_party/cosmo/erf_test.com.ok					\
		o/$(MODE)/third_party/cosmo/encodebase64_test.com.ok				\
		o/$(MODE)/third_party/cosmo/fabs_test.com.ok					\
		o/$(MODE)/third_party/cosmo/fgets_test.com.ok					\
		o/$(MODE)/third_party/cosmo/fileexists_test.com.ok				\
		o/$(MODE)/third_party/cosmo/floor_test.com.ok					\
		o/$(MODE)/third_party/cosmo/fmemopen_test.com.ok				\
		o/$(MODE)/third_party/cosmo/fmt_test.com.ok					\
		o/$(MODE)/third_party/cosmo/fputc_test.com.ok					\
		o/$(MODE)/third_party/cosmo/ftruncate_test.com.ok				\
		o/$(MODE)/third_party/cosmo/gamma_test.com.ok					\
		o/$(MODE)/third_party/cosmo/tgamma_test.com.ok					\
		o/$(MODE)/third_party/cosmo/gclongjmp_test.com.ok				\
		o/$(MODE)/third_party/cosmo/getcwd_test.com.ok					\
		o/$(MODE)/third_party/cosmo/gz_test.com.ok					\
		o/$(MODE)/third_party/cosmo/ilogb_test.com.ok					\
		o/$(MODE)/third_party/cosmo/imaxdiv_test.com.ok					\
		o/$(MODE)/third_party/cosmo/inv3_test.com.ok					\
		o/$(MODE)/third_party/cosmo/iso8601_test.com.ok					\
		o/$(MODE)/third_party/cosmo/itsatrap_test.com.ok				\
		o/$(MODE)/third_party/cosmo/lseek_test.com.ok					\
		o/$(MODE)/third_party/cosmo/mu_starvation_test.com.ok				\
		o/$(MODE)/third_party/cosmo/open_test.com.ok					\
		o/$(MODE)/third_party/cosmo/stat_test.com.ok					\
		o/$(MODE)/third_party/cosmo/stackrwx_test.com.ok				\
		o/$(MODE)/third_party/cosmo/clone_test.com.ok					\
		o/$(MODE)/third_party/cosmo/dup_test.com.ok					\
		o/$(MODE)/third_party/cosmo/cv_test.com.ok					\
		o/$(MODE)/third_party/cosmo/writev_test.com.ok
	@mkdir -p $(@D)
	@touch $@

o/$(MODE)/third_party/cosmo/emulates:								\
		o/$(MODE)/aarch64/third_party/cosmo/intrin_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/divmul_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/test_suite_ecp.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/lockscale_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/palignr_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/pmulhrsw_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/alu_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/bsu_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/pthread_mutex_lock2_test.com.emulates	\
		o/$(MODE)/aarch64/third_party/cosmo/pthread_mutex_lock_test.com.emulates	\
		o/$(MODE)/aarch64/third_party/cosmo/pthread_spin_lock_test.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/sincos_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/round_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/kprintf_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/snprintf_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/once_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/mu_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/note_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/counter_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/dll_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/secp384r1_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/parsehttpmessage_test.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/parseurl_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/parseip_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/parsehttprange_test.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/pcmpstr_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/rand64_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/cescapec_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/clock_gettime_test.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/cas_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/bilinearscale_test.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/access_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/a64l_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/_timespec_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/zleb64_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/xslurp_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/chdir_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/mkdir_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/unlinkat_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/makedirs_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/dirstream_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/bitscan_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/commandv_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/closefrom_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/ecvt_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/division_test.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/test_suite_aes.cbc.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/test_suite_cipher.gcm.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/test_suite_ctr_drbg.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/test_suite_entropy.com.emulates		\
		o/$(MODE)/aarch64/third_party/cosmo/test_suite_md.com.emulates			\
		o/$(MODE)/aarch64/third_party/cosmo/execve_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/intrin_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/mips64el/third_party/cosmo/divmul_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/test_suite_ecp.com.emulates		\
		o/$(MODE)/mips64el/third_party/cosmo/lockscale_test.com.emulates		\
		o/$(MODE)/mips64el/third_party/cosmo/palignr_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/pmulhrsw_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/mips64el/third_party/cosmo/pthread_mutex_lock2_test.com.emulates	\
		o/$(MODE)/mips64el/third_party/cosmo/pthread_mutex_lock_test.com.emulates	\
		o/$(MODE)/mips64el/third_party/cosmo/pthread_spin_lock_test.com.emulates	\
		o/$(MODE)/s390x/third_party/cosmo/intrin_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/divmul_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/test_suite_ecp.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/lockscale_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/palignr_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/pmulhrsw_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/pthread_mutex_lock2_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/pthread_mutex_lock_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/pthread_spin_lock_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/sincos_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/round_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/kprintf_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/snprintf_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/once_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/mu_test.com.emulates				\
		o/$(MODE)/s390x/third_party/cosmo/note_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/counter_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/dll_test.com.emulates				\
		o/$(MODE)/s390x/third_party/cosmo/secp384r1_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/parsehttpmessage_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/parseurl_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/parseip_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/parsehttprange_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/pcmpstr_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/rand64_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/cescapec_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/clock_gettime_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/cas_test.com.emulates				\
		o/$(MODE)/s390x/third_party/cosmo/bilinearscale_test.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/access_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/a64l_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/_timespec_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/zleb64_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/xslurp_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/chdir_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/mkdir_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/unlinkat_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/makedirs_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/dirstream_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/bitscan_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/commandv_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/closefrom_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/ecvt_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/division_test.com.emulates			\
		o/$(MODE)/s390x/third_party/cosmo/test_suite_aes.cbc.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/test_suite_cipher.gcm.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/test_suite_ctr_drbg.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/test_suite_entropy.com.emulates		\
		o/$(MODE)/s390x/third_party/cosmo/test_suite_md.com.emulates			\
		o/$(MODE)/powerpc64le/third_party/cosmo/intrin_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/palandprintf_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/divmul_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/test_suite_ecp.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/lockscale_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/palignr_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/pmulhrsw_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/pshuf_test.com.emulates			\
		o/$(MODE)/powerpc64le/third_party/cosmo/pthread_mutex_lock2_test.com.emulates	\
		o/$(MODE)/powerpc64le/third_party/cosmo/pthread_mutex_lock_test.com.emulates	\
		o/$(MODE)/powerpc64le/third_party/cosmo/pthread_spin_lock_test.com.emulates	\
		o/$(MODE)/powerpc64le/third_party/cosmo/sincos_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/round_test.com.emulates			\
		o/$(MODE)/powerpc64le/third_party/cosmo/kprintf_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/snprintf_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/once_test.com.emulates			\
		o/$(MODE)/powerpc64le/third_party/cosmo/note_test.com.emulates			\
		o/$(MODE)/powerpc64le/third_party/cosmo/counter_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/dll_test.com.emulates			\
		o/$(MODE)/powerpc64le/third_party/cosmo/secp384r1_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/parsehttpmessage_test.com.emulates	\
		o/$(MODE)/powerpc64le/third_party/cosmo/parseurl_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/parseip_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/parsehttprange_test.com.emulates	\
		o/$(MODE)/powerpc64le/third_party/cosmo/pcmpstr_test.com.emulates		\
		o/$(MODE)/powerpc64le/third_party/cosmo/rand64_test.com.emulates
	@mkdir -p $(@D)
	@touch $@
