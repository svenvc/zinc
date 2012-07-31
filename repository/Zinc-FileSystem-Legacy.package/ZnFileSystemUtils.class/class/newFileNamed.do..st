streams
newFileNamed: fileName do: block
	^ self fileStreamClass 
		newFileNamed: fileName 
		do: block