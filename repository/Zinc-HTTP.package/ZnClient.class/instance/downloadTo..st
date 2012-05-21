convenience
downloadTo: path
	"Setup streaming, do a GET request and download the entity directly to a file.
	If path describes a file, use that. 
	If path describes a directory, use the last path segment of the URI to construct a file in that directory.
	Return true when successful, false otherwise."

	self 
		streaming: true; 
		get.
	^ self isSuccess
		ifTrue: [
			self downloadEntityTo: path.
			true ]
		ifFalse: [ 
			false ]