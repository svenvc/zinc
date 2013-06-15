accessing
numbersForGet
	variables isEmpty ifFalse: [ ^ variables collect: [ :each | 
			[ each asNumber ] on: Error do: [ 0 ] ] ].
	(self request uri queryAt: #numbers ifAbsent: [ nil ])
		ifNotNil: [ :numbers | 
			^ (numbers findTokens: { Character space. Character tab. $, }) collect: [ :each | 
				[ each asNumber ] on: Error do: [ 0 ] ] ].
	^ #()