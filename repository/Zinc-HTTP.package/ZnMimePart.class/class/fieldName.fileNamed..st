instance creation
fieldName: fieldName fileNamed: fileName
	| mimeType entry size fileStream entity |
	mimeType := ZnMimeType forFilenameExtension: (FileDirectory extensionFor: fileName).
	fileStream := FileDirectory root oldFileNamed: fileName.
	mimeType isBinary ifTrue: [ fileStream binary ].
	entry := FileDirectory root directoryEntryFor: fileName.
	size := entry fileSize.
	(entity := ZnStreamingEntity type: mimeType length: size)
		stream: fileStream.
	^ self fieldName: fieldName fileName: entry name entity: entity
	