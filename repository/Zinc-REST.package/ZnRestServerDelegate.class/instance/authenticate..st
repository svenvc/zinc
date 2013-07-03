public
authenticate: call
	| authorization |
	authorization := ZnRestServerUtils extractBasicAuthorization: call request.
	^ (self isAuthorizationValid: authorization) 
		ifTrue: [
			authorization ifNotNil: [ 
				call 
					principal: authorization key; 
					credentials: authorization value ].
			call isAuthorized ] 
		ifFalse: [ false ]