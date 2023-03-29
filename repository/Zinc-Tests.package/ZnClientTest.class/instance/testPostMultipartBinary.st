testing
testPostMultipartBinary
	| client filename |
	ZnFileSystemUtils deleteIfExists: 'testPostMultiPart.bin'.
	filename := ZnFileSystemUtils fullNameFor: 'testPostMultiPart.bin'.
	ZnFileSystemUtils binaryWriteStreamFor: filename do: [ :stream | stream nextPutAll: #[0 1 2 3 4 5 6 7 8 9] ].
	self withServerDo: [ :server |
		(client := ZnClient new)
			url: server localUrl;
			addPath: 'echo';
			addPart: (ZnMimePart fieldName: 'username' value: 'john');
			addPart: (ZnMimePart fieldName: 'foo' entity: (ZnEntity bytes: #[1 2 3]));
			addPart: (ZnMimePart fieldName: 'file' fileNamed: filename);
			post.
		self assert: client isSuccess.
		self assert: (client contents includesSubstring: 'multipart') ].
	ZnFileSystemUtils deleteIfExists: 'testPostMultiPart.bin'