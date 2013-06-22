private
writeRawBodyOn: stream
	self isEmpty
		ifFalse: [ stream nextPutAll: body ]