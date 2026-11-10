initialize-release
urlAsIri: boolean
	"When boolean is true, I encode as an IRI, leaving non-ASCII characters as they are, and accept them when decoding.
	Else I percent-encode everything outside my safe set, and reject non-ASCII characters when decoding."

	urlAsIri := boolean