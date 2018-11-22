streams
binaryFileStreamFor: fileName
	| fileReference |
	fileReference := fileName asFileReference.
	^ (fileReference respondsTo: #binaryReadWriteStream)
		ifTrue: [ fileReference binaryReadWriteStream ]
		ifFalse: [ fileReference writeStream binary ]