accessing
localOptions
	"Return my options. This is a writable clone of the global options.
	My options are applicable to everything I do, unless they were dynamically overwritten."

	newOptions ifNil: [ newOptions := ZnOptions globalDefault clone ].
	^ newOptions