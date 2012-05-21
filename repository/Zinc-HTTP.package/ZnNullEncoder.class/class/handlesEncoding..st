accessing
handlesEncoding: string
	"Return true when my instances handle the encoding described by string"
	
	^ #( 'ascii' 'latin1' 'latin-1' 'iso-8859-1' ) includes: string