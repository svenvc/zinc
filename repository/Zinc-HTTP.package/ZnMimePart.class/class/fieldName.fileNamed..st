instance creation
fieldName: fieldName fileNamed: fileName
	| mimeType entry size fileStream entity |
	mimeType := ZnMimeType forFilenameExtension: (ServerFileDirectory extensionFor: fileName).
	fileStream := ServerFileDirectory root oldFileNamed: fileName.
	mimeType isBinary ifTrue: [ fileStream binary ].
	entry := ServerFileDirectory root directoryEntryFor: fileName.
	size := entry fileSize.
	(entity := ZnStreamingEntity type: mimeType length: size)
		stream: fileStream.
	^ self fieldName: fieldName fileName: entry name entity: entity
	
