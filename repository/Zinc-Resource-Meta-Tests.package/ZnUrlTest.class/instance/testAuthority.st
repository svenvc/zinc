testing
testAuthority
	self assert: 'http://localhost:8080/foo/bar/doc.txt' asZnUrl authority equals: 'localhost:8080'.
	self assert: 'http://www.google.com?q=Smalltalk' asZnUrl authority equals: 'www.google.com'