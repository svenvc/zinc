actions
httpDelete: anUrl using: aToken

	| response |
	
	response := self executeRequest: (ZnRequest delete: anUrl) token: aToken.
	response isSuccess
		ifFalse: [ self error: 'httpDelete failed' ].

	^response contents