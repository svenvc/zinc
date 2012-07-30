streams
newFileNamed: fileName do: block
	^ self fileDirectoryClass 
		newFileNamed: fileName 
		do: block