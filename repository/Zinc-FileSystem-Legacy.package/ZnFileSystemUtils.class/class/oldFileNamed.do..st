streams
oldFileNamed: fileName do: block
	^ self fileDirectoryClass 
		oldFileNamed: fileName 
		do: block