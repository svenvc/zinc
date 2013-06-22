operations extra
uploadFile: filename withMd5: md5 inBucket: bucket
	"Do a streaming upload of the file filename to bucket.
	When md5 is notNil, use it to validate the ETag of the response."
	
	| reference entry size mimeType fileStream entity response |
	reference := filename asFileReference.
	entry := reference entry.
	size := entry size.
	mimeType := ZnMimeType forFilenameExtension: reference extension.
	fileStream := reference readStream.
	mimeType isBinary ifTrue: [ fileStream binary ].
	(entity := ZnStreamingEntity type: mimeType length: size)
		stream: fileStream.
	self at: bucket -> reference basename put: entity.
	(md5 notNil and: [ (md5 sameAs: self eTag) not ])
		ifTrue: [ self error: 'Uploaded ETag does not equal supplied MD5' ].
	^ self httpClient response
