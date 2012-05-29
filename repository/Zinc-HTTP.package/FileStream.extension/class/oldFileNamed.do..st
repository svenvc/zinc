*zinc-http
oldFileNamed: fileName do: aBlock
	"Returns the result of aBlock."
	
	^ self detectFile: [ self read: fileName ] do: aBlock