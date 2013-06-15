accessing
size
	"Return the body size in bytes"
	
	^ body 
		ifNil: [ 0 ] 
		ifNotNil: [ body size ].