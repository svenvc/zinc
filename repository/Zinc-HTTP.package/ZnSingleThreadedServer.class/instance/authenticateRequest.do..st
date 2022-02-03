request handling
authenticateRequest: request do: block
	"Validate request and execute block.
	When our authenticator is not nil, pass the responsibility"

	^ self authenticator
		ifNil: [ block value ]
		ifNotNil: [ :authenticator | authenticator authenticateRequest: request do: block ]