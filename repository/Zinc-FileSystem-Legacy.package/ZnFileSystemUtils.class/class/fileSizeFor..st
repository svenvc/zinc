queries
fileSizeFor: fileName
	^ (self fileDirectoryClass root directoryEntryFor: fileName) fileSize