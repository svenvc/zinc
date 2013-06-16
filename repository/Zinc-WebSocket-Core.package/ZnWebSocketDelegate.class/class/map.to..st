instance creation
map: prefix to: handler
	"Create and return a new ZnWebSocketDelegate that maps prefix string to handler"

	^ self new
		prefixFromString: prefix;
		handler: handler;
		yourself