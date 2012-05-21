running
setUp
	self tearDown.
	FileDirectory default 
		newFileNamed: 'small.html' 
		do: [ :stream |
			stream nextPutAll: self smallHtml ]