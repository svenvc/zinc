public
put
	| data objectUri |
	objectUri := '/storage/objects/{1}' format: { variables first }.
	(self delegate storage includesKey: objectUri) ifFalse: [ ^ self notFound ].
	data := self jsonRequest.
	data at: #'object-uri' put: objectUri.
	self delegate storage at: objectUri put: data.
	self emptyOkResponse 