streams
oldFileNamed: fileName do: block
	^ FileStream 
		oldFileNamed: fileName 
		do: block