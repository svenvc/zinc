public
delete
	| objectUri |
	objectUri := '/storage/objects/{1}' format: { variables first }.
	self delegate storage removeKey: objectUri ifAbsent: [ ^ self notFound ].
	self emptyOkResponse