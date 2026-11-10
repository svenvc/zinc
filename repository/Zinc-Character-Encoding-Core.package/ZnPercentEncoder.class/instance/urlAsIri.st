accessing
urlAsIri
	"Return if I encode as an IRI, leaving non-ASCII characters as they are, and accept them when decoding.
	ZnUrl and friends set this from the #urlAsIri ZnOptions, which this package cannot see."

	^ urlAsIri ifNil: [ urlAsIri := false ]