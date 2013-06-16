public
handleRequest: request
	| call |
	(call := self match: request) 
		ifNil: [ ^ self noHandlerFound: request ].
	(self authenticate: call)
		ifFalse: [ ^ self callUnauthorized: request ].
	^ [ self execute: call ]
		on: Exception
		do: [ :exception | 
			request server debugMode
				ifTrue: [ exception pass ]
				ifFalse: [ self serverError: request exception: exception ] ]