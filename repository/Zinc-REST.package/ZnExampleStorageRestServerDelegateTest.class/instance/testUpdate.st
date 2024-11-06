testing
testUpdate
	"To update an existing object you PUT a new JSON map representation to an existing uri"
	
	| data objectUri |
	data := Dictionary with: 'x' -> 'foo' with: 'y' -> 'bar'.
	client
		addPathSegment: 'objects';
		contents: data;
		post.
	self assert: client isCreated.
	objectUri := client response location.
	client resetEntity.
	data at: 'z' put: 100.
	client
		url: objectUri; 
		contents: data;
		put.
	self assert: client isSuccess.
	client resetEntity.
	client get.
	self assert: client isSuccess.
	data keysAndValuesDo: [ :key :value |
		(client contents at: key) = value ].
	self assert: (client contents at: 'object-uri') equals: objectUri.
	self assert: (client contents at: 'z') equals: 100