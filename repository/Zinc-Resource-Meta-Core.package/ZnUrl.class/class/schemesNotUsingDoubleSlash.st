accessing
schemesNotUsingDoubleSlash
	"Most URL schemes use a double slash, as in http://
	but some don't, return a list of those"
	"'file' is a special case as it can appear as both file:// and file:"
	^ #( #mailto #telnet #file )