streams
newBinaryFileNamed: fileName do: block
	| fileReference |
	fileReference := fileName asFileReference.
	^ (fileReference respondsTo: #binaryWriteStreamDo:ifPresent:)
		ifTrue: [
			fileName asFileReference
				binaryWriteStreamDo: block
				ifPresent: [ FileExists signalWith: fileReference ] ]
		ifFalse: [
			fileReference isFile
				ifTrue: [ FileExists signalWith: fileReference ]
				ifFalse: [ block value: (self binaryFileStreamFor: fileName) ] ]