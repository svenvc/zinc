converting
humanReadableSize: byteCount
	"Answer byteCount in SI units, by 1000 rather than 1024, e.g. '1.50 kB'.
	Pharo 11 renamed #humanReadableSIByteSize to #humanReadableSISizeString, and Pharo 13 removed the old name."

	^ (byteCount respondsTo: #humanReadableSISizeString)
		ifTrue: [ byteCount humanReadableSISizeString ]
		ifFalse: [ byteCount humanReadableSIByteSize ]