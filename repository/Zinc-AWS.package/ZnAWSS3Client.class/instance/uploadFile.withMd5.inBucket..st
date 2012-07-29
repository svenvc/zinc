operations extra
uploadFile: filename withMd5: md5 inBucket: bucket
	"Do a streaming upload of the file filename to bucket.
	When md5 is notNil, use it to validate the ETag of the response."
	
	| entry size mimeType fileStream entity response |
	entry := FileDirectory root directoryEntryFor: filename.
	size := entry fileSize.
	mimeType := ZnMimeType forFilenameExtension: (FileDirectory extensionFor: filename).
	fileStream := FileDirectory root readOnlyFileNamed: filename.
	mimeType isBinary ifTrue: [ fileStream binary ].
	(entity := ZnStreamingEntity type: mimeType length: size)
		stream: fileStream.
	self at: bucket -> entry name put: entity.
	(md5 notNil and: [ (md5 sameAs: self eTag) not ])
		ifTrue: [ self error: 'Uploaded ETag does not equal supplied MD5' ].
	^ self httpClient response
