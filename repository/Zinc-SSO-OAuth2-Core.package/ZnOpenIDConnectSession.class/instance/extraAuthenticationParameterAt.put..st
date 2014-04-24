accessing
extraAuthenticationParameterAt: aKey put: aStringOrNil

	aStringOrNil isNil
		ifTrue: [ self extraAuthenticationParameters removeKey: aKey ifAbsent: [  ] ]
		ifFalse: [ self extraAuthenticationParameters at: aKey put: aStringOrNil ]