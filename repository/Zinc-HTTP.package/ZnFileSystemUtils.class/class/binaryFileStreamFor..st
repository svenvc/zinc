streams
binaryFileStreamFor: fileName
	| fileReference |
	fileReference := fileName asFileReference.
	^ (fileReference respondsTo: #binaryReadWriteStream)
		ifTrue: [ fileReference perform: #binaryReadWriteStream ]
		ifFalse: [ fileReference writeStream binary ]