streams
fileNamed: fileName do: block
	^ FileStream 
		fileNamed: fileName 
		do: block