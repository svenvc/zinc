instance creation
fieldName: fieldName fileNamed: fileName
	| mimeType size fileStream entity baseName |
	mimeType := ZnMimeType forFilenameExtension: (ZnFileSystemUtils extensionFor: fileName).
	fileStream := ZnFileSystemUtils binaryReadStreamFor: fileName.
	size := ZnFileSystemUtils fileSizeFor: fileName.
	(entity := ZnStreamingEntity type: mimeType length: size)
		stream: fileStream.
	baseName := ZnFileSystemUtils baseNameFor: fileName.
	^ self fieldName: fieldName fileName: baseName entity: entity