streams
fileNamed: fileName do: block
	^ self fileDirectoryClass 
		fileNamed: fileName 
		do: block