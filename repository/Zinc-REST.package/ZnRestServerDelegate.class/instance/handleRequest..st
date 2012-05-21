public
handleRequest: request
	| call |
	(call := self match: request)
		ifNil: [ ^ self noHandlerFound: request ].
	(self authenticate: call)
		ifFalse: [ ^ self callUnauthorized: request ].
	^ self debug 
		ifTrue: [ self execute: call ]
		ifFalse: [ 
			[ self execute: call ] 
				on: Exception 
				do: [ :exception | self serverError: request exception: exception ] ]