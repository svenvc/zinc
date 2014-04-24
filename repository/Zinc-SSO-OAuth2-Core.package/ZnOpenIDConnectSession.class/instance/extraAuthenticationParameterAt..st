accessing
extraAuthenticationParameterAt: aKey

	^self extraAuthenticationParameters at: aKey ifAbsent: [ nil ]