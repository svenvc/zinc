public
get
	| data objectUri |
	objectUri := '/storage/objects/{1}' format: { variables first }.
	data := self delegate storage at: objectUri ifAbsent: [ ^ self notFound ].
	self jsonResponse: data