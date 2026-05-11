responses
echoRequestRaw: request
	"Echo request by answering the same entity sent as payload, if any"

	| entity |
	entity := request hasEntity 
		ifTrue: [ request entity ] 
		ifFalse: [ ZnEntity with: String new ].
	^ ZnResponse ok: entity