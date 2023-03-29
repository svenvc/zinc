accessing
singleAt: headerName ifAbsent: block
	"Return the value stored under headerName,
	a String for single-valued headers,
	or the last String from an Array of Strings for multi-valued headers.
	Executes block when the headerName is not found"

	| value |
	self isEmpty ifTrue: [ ^ block value ].
	value := self headers at: (self normalizeHeaderKey: headerName) ifAbsent: block.
	^ value isString
		ifTrue: [ value ]
		ifFalse: [ value last ]