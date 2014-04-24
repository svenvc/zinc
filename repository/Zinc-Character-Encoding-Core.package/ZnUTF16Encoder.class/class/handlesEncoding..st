accessing
handlesEncoding: string
	"Return true when my instances handle the encoding described by string"

	^ #( 'utf-16' 'utf16' 'utf-16be' 'utf-16le' 'utf16be' 'utf16le' ) includes: string