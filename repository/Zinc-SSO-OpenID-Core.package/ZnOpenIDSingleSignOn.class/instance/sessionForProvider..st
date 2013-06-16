accessing
sessionForProvider: aProvider

	^self providerSessions
		detect: [ :each | each provider = aProvider ]
		ifNone: [ self providerSessions add: aProvider createSession ]