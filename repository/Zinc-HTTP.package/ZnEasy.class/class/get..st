operations
get: urlObject
	"ZnClient get: 'http://caretaker.wolf359.be/small.html'."
	
	^ self client
		url: urlObject;
		get;
		response
	