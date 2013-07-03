actions
httpPut: anUrl with: anEntity using: aToken

	| response request |
	
	request := ZnRequest put: anUrl.
	request entity: anEntity.
	
	response := self executeRequest: request token: aToken.
	response isSuccess
		ifFalse: [ self error: 'httpPut failed' ].

	^ response contents