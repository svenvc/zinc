running
setUp
	self tearDown.
	ZnFileSystemUtils
		newFileNamed: 'small.html' 
		do: [ :stream |
			stream nextPutAll: self smallHtml ]