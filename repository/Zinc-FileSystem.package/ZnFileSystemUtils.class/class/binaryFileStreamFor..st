streams
binaryFileStreamFor: fileName
	| fileReference |
	fileReference := fileName asFileReference.
	^ (fileReference respondsTo: #binaryWriteStream)
		ifTrue: [ fileReference binaryWriteStream ]
		ifFalse: [ fileReference writeStream binary ]