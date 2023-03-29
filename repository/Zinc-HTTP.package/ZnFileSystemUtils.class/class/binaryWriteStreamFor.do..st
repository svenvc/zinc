streams
binaryWriteStreamFor: fileName do: block
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
				ifFalse: [ | binaryStream |
					binaryStream := self binaryWriteStreamFor: fileName.
					[ block value: binaryStream ] ensure: [ binaryStream close ] ] ]