testing
testDelete
	"You delete an existing entry by doing a DELETE on its uri"
	
	| data objectUri |
	data := Dictionary with: #x -> 'foo' with: #y -> 'bar'.
	client
		addPathSegment: 'objects';
		contents: data;
		post.
	self assert: client isCreated.
	objectUri := client response location.
	client resetEntity.
	client 
		url: objectUri; 
		get.
	self assert: client isSuccess.
	client delete.
	self assert: client isSuccess.
	client get.
	self deny: client isSuccess.
	self assert: client isNotFound