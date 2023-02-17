accessing
maxage: numberOfSeconds
	"To be able to use this to validate expiration, a time of creation has to be recorded, so right now, this is not really usable."

	^ attributes at: 'max-age' put: numberOfSeconds asString