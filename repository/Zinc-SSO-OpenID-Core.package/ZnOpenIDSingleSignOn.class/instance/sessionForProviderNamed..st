accessing
sessionForProviderNamed: aString

	| provider |
	
	provider := self providers detect: [ :each | each name = aString ].
	^self sessionForProvider: provider