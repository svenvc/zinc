queries
modificationTimeFor: path
	^ (self fileDirectoryClass default directoryEntryFor: path) modificationDateAndTime