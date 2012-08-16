operations extra
downloadFile: filename fromBucket: bucket
	"Do a streaming download of the key filename from bucket,
	creating it as a file with that name in the current directory."
	
	| streaming response |
	streaming := self httpClient streaming.
	self httpClient streaming: true.
	response := self at: bucket -> filename.
	self httpClient streaming: streaming.
	response isSuccess ifFalse: [ ^ ZnHttpUnsuccessful signal ].
	FileStream 
		fileNamed: filename 
		do: [ :stream | response entity writeOn: stream ].
	^ response
