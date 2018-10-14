baseline
baseline: spec
	<baseline>
	spec
		for: #(#'pharo6.x' #'pharo7.x')
		do: [ self consCell: spec.
			self lispReader: spec.
			self log4s: spec.
			spec
				package: 'Swank-Client-Tests'
					with: [ spec
						requires: #('ConsCell' 'Swank-Client') ];
				package: 'Swank-Client'
					with: [ spec
						requires: #('LispReader' 'ConsCell' 'Log4s' 'Swank-Client-Support') ];
				package: 'Swank-Client-Support'.
			spec
				group: 'default'
				with: #('Swank-Client' 'Swank-Client-Support').
			spec group: 'tests' with: #('Swank-Client-Tests') ]