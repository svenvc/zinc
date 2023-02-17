options
maximumEntitySize: integer
	"Set the maximum entity size in bytes that I will read from a stream before signalling ZnEntityTooLarge"

	self localOptions at: #maximumEntitySize put: integer