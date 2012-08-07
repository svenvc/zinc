private
responseForFile: filename fromRequest: aRequest
	| entry size time mimeType fileStream entity response modified |
	entry := ZnFileSystemUtils fileDirectoryClass root directoryEntryFor: filename.
	size := entry fileSize.
	time := entry modificationDateAndTime.
	modified := true.
	aRequest headers
		at: 'If-Modified-Since'
		ifPresent: [ modified := time > (ZnUtils parseHttpDate: (aRequest headers at: 'If-Modified-Since')) ].
	modified
		ifTrue: [ 
			mimeType := ZnMimeType forFilenameExtension: (ZnFileSystemUtils fileDirectoryClass extensionFor: filename).
			fileStream := ZnFileSystemUtils fileDirectoryClass root oldFileNamed: filename.
			mimeType isBinary
				ifTrue: [ fileStream binary ].
			(entity := ZnStreamingEntity type: mimeType length: size) stream: fileStream.
			(response := ZnResponse ok: entity) 
				headers at: 'Modification-Date' put: (ZnUtils httpDate: time).
			(self maxAgeFor: mimeType) 
				ifNotNil: [ :maxAge | response headers at: 'Cache-Control' put: maxAge ].
			(self expirationDateFor: mimeType)
				ifNotNil: [ :expirationDate | response headers at: 'Expires' put: expirationDate ] ]
		ifFalse: [ response := ZnResponse notModified ].
	^ response