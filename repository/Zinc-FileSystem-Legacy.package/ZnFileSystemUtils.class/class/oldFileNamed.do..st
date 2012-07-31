streams
oldFileNamed: fileName do: block
	^ self fileStreamClass 
		oldFileNamed: fileName 
		do: block