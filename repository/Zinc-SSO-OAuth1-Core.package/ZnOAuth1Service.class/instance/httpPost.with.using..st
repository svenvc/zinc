actions
httpPost: anUrl with: anEntity using: aToken

	| response request |
	
	request := ZnRequest post: anUrl.
	request entity: anEntity.
	
	response := self executeRequest: request token: aToken.
	response isSuccess
		ifFalse: [ self error: 'httpPost failed' ].

	^ response contents