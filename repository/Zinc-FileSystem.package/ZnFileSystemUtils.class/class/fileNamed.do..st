streams
fileNamed: fileName do: block
	^ fileName asFileReference 
		fileStreamDo: block