accessing
handlesEncoding: string
	"Return true when my instances handle the encoding described by string"
	
	^ #( 'utf-8' 'utf8' ) includes: string