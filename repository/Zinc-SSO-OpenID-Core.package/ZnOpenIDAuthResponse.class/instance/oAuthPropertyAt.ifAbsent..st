accessing oauth
oAuthPropertyAt: aString ifAbsent: aBlock

	| prefix |
	
	prefix := self prefixForNamespace: self class nsOAuth ifAbsent: [ ^aBlock value ].
	^self propertyAt: ('openid.', prefix, '.', aString) ifAbsent: aBlock
	