converting
nextPut: character toStream: stream
	"In non-strict mode, we let characters for holes in our mapping table pass through"
	
	| code |
	(code := character codePoint) < 128
		ifTrue: [ stream nextPut: code ]
		ifFalse: [ 
			| byte |
			byte := unicodeToByte at: code ifAbsent: [ nil ].
			(byte isNil and: [ strict or: [ code > 255 ] ])
				ifTrue: [ self error: 'Character code outside encoder range' ].
			stream nextPut: (byte ifNil: [ code ]) ]