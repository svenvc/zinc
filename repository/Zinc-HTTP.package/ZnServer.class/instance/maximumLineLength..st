options
maximumLineLength: integer
	"Set the maximum line length in bytes that I will read from a stream before signalling ZnLineTooLong"

	self localOptions at: #maximumLineLength put: integer