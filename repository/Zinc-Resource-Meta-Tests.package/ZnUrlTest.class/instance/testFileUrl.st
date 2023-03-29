testing
testFileUrl
	| url |
	url := 'file://localhost/Users/Sven/Desktop/foo.txt' asZnUrl.
	self assert: url isFile.
	self assert: url host equals: 'localhost'.
	self assert: url pathSegments equals: #( 'Users' 'Sven' 'Desktop' 'foo.txt' ) asOrderedCollection.
	url := 'file:///Users/Sven/Desktop/foo.txt' asZnUrl.
	self assert: url isFile.
	self deny: url hasHost.
	self assert: url pathSegments equals: #( 'Users' 'Sven' 'Desktop' 'foo.txt' ) asOrderedCollection.
	url := 'file:/Users/Sven/Desktop/foo.txt' asZnUrl.
	self assert: url isFile.
	self deny: url hasHost.
	self assert: url pathSegments equals: #( 'Users' 'Sven' 'Desktop' 'foo.txt' ) asOrderedCollection