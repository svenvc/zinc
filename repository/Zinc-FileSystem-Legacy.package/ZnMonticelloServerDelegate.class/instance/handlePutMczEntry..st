private
handlePutMczEntry: request
	| name |
	name := request uri firstPathSegment.
	^ ((self isValidMczName: name) and: [ (self directory fileExists: name) not ]) 
		ifTrue: [
			self directory newFileNamed: name do: [ :file |
				file binary.
				request entity writeOn: file ].
			ZnResponse created: request uri ]
		ifFalse: [ ZnResponse badRequest: request ]