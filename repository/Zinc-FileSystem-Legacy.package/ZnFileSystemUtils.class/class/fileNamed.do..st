streams
fileNamed: fileName do: block
	^ self fileStreamClass 
		fileNamed: fileName 
		do: block