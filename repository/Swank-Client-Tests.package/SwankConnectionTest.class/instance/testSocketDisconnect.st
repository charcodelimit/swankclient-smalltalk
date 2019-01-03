tests
testSocketDisconnect
	| stream |
	stream := self setUpStream.
	connection connect.
	self assert: connection isAlive not.
	self assert: connection isDead not.
	self assert: connection isClosing not.
	connection close.
	self assert: connection isAlive not.
	self assert: connection isDead not.
	self assert: connection isClosing.
	self assert: stream getSentData = '000026(:emacs-rex nil :common-lisp-user t 1)'.
	"returned data"
	stream
		setReceivedData:
			'0004DD(:new-features (:swank :sb-bsd-sockets-addrinfo :asdf3.3 :asdf3.2 :asdf3.1 :asdf3 :asdf2 :asdf :os-unix :non-base-chars-exist-p :asdf-unicode :64-bit :64-bit-registers :alien-callbacks :ansi-cl :ash-right-vops :c-stack-is-control-stack :call-symbol :common-lisp :compact-instance-header :compare-and-swap-vops :complex-float-vops :cycle-counter :elf :float-eql-vops :fp-and-pc-standard-save :gcc-tls :gencgc :ieee-floating-point :immobile-code :immobile-space :inline-constants :integer-eql-vop :largefile :linkage-table :linux :little-endian :memory-barrier-vops :multiply-high-vops :os-provides-blksize-t :os-provides-dladdr :os-provides-dlopen :os-provides-getprotoby-r :os-provides-poll :os-provides-putwc :os-provides-suseconds-t :package-local-nicknames :raw-instance-init-vops :raw-signed-word :relocatable-heap :sb-after-xc-core :sb-core-compression :sb-doc :sb-eval :sb-futex :sb-ldb :sb-package-locks :sb-simd-pack :sb-source-locations :sb-thread :sb-unicode :sb-xref-for-internals :sbcl :stack-allocatable-closures :stack-allocatable-fixed-objects :stack-allocatable-lists :stack-allocatable-vectors :stack-grows-downward-not-upward :symbol-info-vops :unbind-n-vop :undefined-fun-restarts :unix :unwind-to-frame-and-call-vop :x86-64))'.
	connection dispatchEvents.
	self assert: connection isAlive not.
	self assert: connection isDead.
	self assert: connection isClosing not