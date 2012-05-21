testing
testUploadSmallDocument
	self withServerDo: [ :server | | client contents path |
		path := (FileDirectory default / 'small.txt') fullName.
		contents := String streamContents: [ :stream |
			stream print: DateAndTime now; space; print: 9999 atRandom ].
		(FileDirectory default fileExists: 'small.txt')
			ifTrue: [ FileDirectory default deleteFileNamed: 'small.txt' ].
		FileStream fileNamed: path do: [ :stream | stream nextPutAll: contents ].
		(client := ZnClient new)
			url: server localUrl;
			addPath: 'echo';
			uploadEntityFrom: path.
		self assert: client request entity contentType = ZnMimeType textPlain.
		client contentType: ZnMimeType textPlain. "Not needed, just test the code path"
		self assert: client request entity contentType = ZnMimeType textPlain.
		client post.
		self assert: client isSuccess.
		self assert: client entity contentType = ZnMimeType textPlain.
		self assert: (client contents includesSubString: contents).
		client close.
		(FileDirectory default fileExists: 'small.txt')
			ifTrue: [ FileDirectory default deleteFileNamed: 'small.txt' ] ]