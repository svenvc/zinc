accessing
at: headerName ifAbsent: block
	"Return the value stored under headerName,
	a String for single-valued headers, an Array of Strings for multi-valued headers.
	Executes block when the headerName is not found"

	self isEmpty ifTrue: [ ^ block value ].
	^ self headers at: (self normalizeHeaderKey: headerName) ifAbsent: block