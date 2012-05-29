*zinc-http
fileNamed: fileName do: aBlock
	"Returns the result of aBlock."
	
	^ self detectFile: [ self write: fileName ] do: aBlock