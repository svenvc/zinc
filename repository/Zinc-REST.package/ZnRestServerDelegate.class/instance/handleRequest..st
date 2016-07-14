public
handleRequest: request
	| call |
	(call := self match: request) 
		ifNil: [ ^ self noHandlerFound: request ].
	(self authenticate: call)
		ifFalse: [ ^ self callUnauthorized: request ].
	^ [ self execute: call ]
		on: Error
		do: [ :exception | 
			self 
				handleException: exception 
				request: request ]