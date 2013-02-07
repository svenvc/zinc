accessing attribute exchange
axPropertyAt: aString ifAbsent: aBlock

	| prefix |
	
	prefix := self prefixForNamespace: self class nsAttributeExchangeExtension ifAbsent: [ ^aBlock value ].
	^self propertyAt: ('openid.', prefix, '.', aString) ifAbsent: aBlock
	