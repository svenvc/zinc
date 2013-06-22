actions
sign: aString andCheck: aSignature
	"Answer whether the calculated signature for ==aString== is equal to ==aSignature==."

	| calculatedSig checkSignature key |

	self isHmacSHA1 
		ifFalse: [ self error: 'Cannot sign, unknown assoc_type' ].

	key := ZnBase64Encoder new decode: self macKey.
	calculatedSig := self class signStringSHA1: aString usingSecret: key.
	checkSignature := aSignature collect: [ :ch | ch = Character space ifTrue: [ $+ ] ifFalse: [ ch ]].
	^calculatedSig = checkSignature 
	
