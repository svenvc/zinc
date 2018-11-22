streams
binaryReadStreamFor: fileName
	| fileReference |
	fileReference := fileName asFileReference.
	^ (fileReference respondsTo: #binaryReadStream)
		ifTrue: [ fileReference binaryReadStream ]
		ifFalse: [ fileReference readStream binary ]