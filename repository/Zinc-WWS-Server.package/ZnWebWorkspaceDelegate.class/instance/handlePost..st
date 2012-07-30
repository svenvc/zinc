private request handling
handlePost: request
	| key |
	(request hasEntity and: [ request entity contentType isBinary not ])
		ifFalse: [ ^ ZnResponse badRequest: request ].
	key := self generateNewKey.
	workspaces at: key put: request contents.
	^ ZnResponse created: key