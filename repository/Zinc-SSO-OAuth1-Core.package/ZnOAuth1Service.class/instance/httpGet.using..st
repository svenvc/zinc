actions
httpGet: anUrl using: aToken

	| response |
	
	response := self executeRequest: (ZnRequest get: anUrl) token: aToken.
	response isSuccess
		ifFalse: [ self error: 'httpGet failed' ].

	^response contents