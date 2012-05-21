printing
printOn: stream
	self timeStamp printYMDOn: stream.
	stream space.
	self timeStamp printHMSOn: stream.
	stream space.
	self processId printOn: stream base: 10 length: 6 padded: true.
	stream space; nextPut: self category first asUppercase.
	self message isNil ifFalse: [ stream space; nextPutAll: self message ]