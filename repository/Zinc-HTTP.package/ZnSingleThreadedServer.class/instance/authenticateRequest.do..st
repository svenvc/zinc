private
authenticateRequest: request do: block
	"Validate request and execute block.
	When our authenticator is not nil, pass the responsability"

	^ self authenticator isNil
		ifTrue: [ block value ]
		ifFalse: [ self authenticator authenticateRequest: request do: block ]