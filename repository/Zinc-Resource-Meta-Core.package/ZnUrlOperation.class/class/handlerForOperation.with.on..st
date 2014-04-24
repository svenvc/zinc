operations
handlerForOperation: operation with: argument on: url
	"Search for a subclass that can handle operation with argument on url.
	Signal an Error when no matching handler is found."

	self subclassesDo: [ :each |
		(each operation = operation and: [ each schemes includes: url scheme ])
			ifTrue: [ ^ each ] ].
	self error: 
		('No URL hander found for operation {1} on URL {2} with {3}' 
			format: { operation. url. argument })