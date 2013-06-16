private
handleGetMczEntry: request
	| name |
	name := request uri firstPathSegment.
	^ ((self isValidMczName: name) and: [ self directory fileExists: name ]) 
		ifTrue: [ | file entity |
			(file := self directory readOnlyFileNamed: name)
				binary.
			(entity := ZnStreamingEntity type: ZnMimeType applicationOctetStream length: file size)
				stream: file.
			ZnResponse ok: entity ]
		ifFalse: [ ZnResponse notFound: request uri ]