accessing
delegate
	"Return the optional delegate, 
	the object that will be sent #handleRequest: to handle a request and produce a response.
	The default delegate is ZnDefaultServerDelegate"
	
	delegate isNil ifTrue: [ delegate := ZnDefaultServerDelegate new ].
	^ delegate