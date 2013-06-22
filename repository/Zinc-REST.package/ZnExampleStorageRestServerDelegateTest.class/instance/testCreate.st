testing
testCreate
	"You create a new entry by posting a JSON map representation to /storage/objects
	The result is a 201 Created response with the URI of the new object both
	returned as a JSON string and as the Location header"
	
	| data objectUri |
	data := Dictionary with: #x -> 'foo' with: #y -> 'bar'.
	client
		addPathSegment: 'objects';
		contents: data;
		post.
	self assert: client isSuccess.
	self assert: client isCreated.
	objectUri := client response location.
	self assert: objectUri isString & objectUri isEmpty not.
	self assert: client contents equals: objectUri.
	client resetEntity.
	client get.
	self assert: client isSuccess.
	self assert: (client contents includes: objectUri).
	client 
		url: objectUri; 
		get.
	self assert: client isSuccess.
	data keysAndValuesDo: [ :key :value |
		(client contents at: key) = value ].
	self assert: (client contents at: #'object-uri') equals: objectUri 