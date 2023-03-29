running
setUp
	super setUp.
	ZnFileSystemUtils
		writeStreamFor: 'small.html'
		do: [ :stream |
			stream nextPutAll: self smallHtml ].
	ZnFileSystemUtils
		writeStreamFor: 'large.html'
		do: [ :stream |
			stream nextPutAll: self largeHtml ].
	ZnFileSystemUtils
		writeStreamFor: 'wide.html'
		do: [ :stream |
			stream nextPutAll: self wideHtml ].
	ZnFileSystemUtils
		writeStreamFor: 'index.html'
		do: [ :stream |
			stream nextPutAll: self indexHtml ]