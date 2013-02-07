public
post
	| data newUri |
	data := self jsonRequest.
	data isDictionary
		ifTrue: [ 
			newUri := '/storage/objects/{1}' format: { self delegate nextId printString }.
			data at: #'object-uri' put: newUri.
			self delegate storage at: newUri put: data.
			self created: newUri ]
		ifFalse: [ self badRequest: 'JSON map expected' ]