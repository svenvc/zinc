initialization
withOptions: block
	"Execute block with my options as argument.
	This is useful when using me in a builder fashion."

	^ block value: self localOptions