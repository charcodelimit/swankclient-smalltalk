tests
testReturnEvent
	| stream promise result |
	stream := self setUpStream.
	connection connect.
	promise := connection send: SlimeConnectionInfoCommand new.
	self assert: (promise isKindOf: Promise).
	self
		assert:
			stream getSentData
				equals: ('00003b(:emacs-rex (swank:connection-info) :common-lisp-user t 1)' , Character linefeed asString).
	stream
		setReceivedData:
			'0007FD(:return (:ok (:pid 21531 :style :spawn :encoding (:coding-systems ("utf-8-unix" "iso-latin-1-unix")) :lisp-implementation (:type "Clozure Common Lisp" :name "ccl" :version "Version 1.12-dev-r16752  (LinuxX8664)" :program nil) :machine (:instance "localhost.localdomain" :type "x86_64" :version "Intel(R) Core(TM) i5-3317U CPU @ 1.70GHz") :features (:swank :asdf-package-system :asdf3.1 :asdf3 :asdf2 :asdf :os-unix :primary-classes :common-lisp :openmcl :ccl :ccl-1.2 :ccl-1.3 :ccl-1.4 :ccl-1.5 :ccl-1.6 :ccl-1.7 :ccl-1.8 :ccl-1.9 :ccl-1.10 :ccl-1.11 :ccl-1.12 :clozure :clozure-common-lisp :ansi-cl :unix :openmcl-unicode-strings :ipv6 :openmcl-native-threads :openmcl-partial-mop :mcl-common-mop-subset :openmcl-mop-2 :openmcl-private-hash-tables :static-conses-should-work-with-egc-in-ccl :x86-64 :x86_64 :x86-target :x86-host :x8664-target :x8664-host :linux-host :linux-target :linuxx86-target :linuxx8664-target :linuxx8664-host :64-bit-target :64-bit-host :linux :little-endian-target :little-endian-host) :modules ("XREF" "ASDF" "asdf" "UIOP" "uiop" "PREPARE-MCL-ENVIRONMENT" "SOCKETS" "LISPEQU" "CN-ENCODE" "JP-ENCODE" "VERSION" "CCL-EXPORT-SYMS" "LOOP" "MCL-COMPAT" "REMOTE-LISP" "SWANK-LOADER" "DOMINANCE" "CORE-FILES" "LEAKS" "COVER" "SWINK" "DESCRIBE" "EDIT-CALLERS" "ARGLIST" "COMPILE-CCL" "SYSTEMS" "TIME" "PATHNAMES" "DUMPLISP" "PPRINT" "MISC" "METHOD-COMBINATION" "ENCAPSULATE" "CASE-ERROR" "DB-IO" "FFI-LINUXX8664" "FOREIGN-TYPES" "X86-LAPMACROS" "X86-DISASSEMBLE" "NXENV" "SOURCE-FILES" "APROPOS" "ARRAYS-FRY" "READ" "BACKTRACE" "X86-BACKTRACE" "BACKTRACE-LDS" "BACKQUOTE" "NFCOMP" "DEFSTRUCT-LDS" "DEFSTRUCT-MACROS" "OPTIMIZERS" "STREAMS" "FORMAT" "SETF-RUNTIME" "SETF" "MACROS" "LEVEL-2" "X86-BACKEND" "X8664-BACKEND" "X8664-VINSNS" "NX" "HASH" "ACODE-REWRITE" "X862" "NX2" "REG" "VINSN" "BACKEND" "VREG" "X8664-ARCH" "X8632-ARCH" "X86-LAP" "X86-ASM" "X86-ARCH" "ARCH" "SUBPRIMS" "NUMBERS" "SORT" "SEQUENCES" "CHARS" "DLL-NODE" "DEFSTRUCT" "LISTS") :package (:name "COMMON-LISP-USER" :prompt "CL-USER") :version "2.19")) 1)'
				, Character linefeed asString.
	self assert: stream isConnected.
	self assert: stream isDataAvailable.
	connection dispatchEvents.
	result := promise wait.
	self assert: result notNil.
	self assert: result length = 18