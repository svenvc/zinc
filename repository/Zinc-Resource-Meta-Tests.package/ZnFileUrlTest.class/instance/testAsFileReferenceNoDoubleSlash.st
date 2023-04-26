testing
testAsFileReferenceNoDoubleSlash
	| fileUrl fileReference |
	fileUrl := 'file:/foo/bar/test.txt' asZnUrl.
	self assert: fileUrl asString equals: 'file:///foo/bar/test.txt'.
	fileReference := fileUrl asFileReference.
	self assert: fileReference basename equals: 'test.txt'.
	self assert: fileReference pathSegments asArray equals: #( 'foo' 'bar' 'test.txt' ).
	self assert: fileReference isAbsolute