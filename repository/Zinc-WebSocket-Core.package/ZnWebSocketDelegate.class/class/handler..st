instance creation
handler: handler
	"Create and return a new ZnWebSocketDelegate that maps / to handler"

	^ self new
		handler: handler;
		yourself