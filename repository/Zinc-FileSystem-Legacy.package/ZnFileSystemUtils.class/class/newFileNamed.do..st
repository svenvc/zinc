streams
newFileNamed: fileName do: block
	^ FileStream 
		newFileNamed: fileName 
		do: block