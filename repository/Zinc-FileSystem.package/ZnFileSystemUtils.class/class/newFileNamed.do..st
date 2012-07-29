streams
newFileNamed: fileName do: block
	^ fileName asFileReference 
		writeStreamDo: block
		ifPresent: [ self error: fileName asString, ' already exists' ]