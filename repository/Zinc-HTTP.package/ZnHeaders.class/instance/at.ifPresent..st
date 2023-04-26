accessing
at: headerName ifPresent: block
	"Return the value stored under headerName,
	a String for single-valued headers, an Array of Strings for multi-valued headers.
	Executes block when the headerName is found"

	^ self headers at: (self normalizeHeaderKey: headerName) ifPresent: block