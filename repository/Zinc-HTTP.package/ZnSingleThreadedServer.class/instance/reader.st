accessing
reader
	"Return a block that when given a stream reads an entity from it."
	
	^ reader ifNil: [ 
		reader := [ :stream | ZnRequest readFrom: stream ] ]