printing
printQueryOn: stream
	stream nextPut: $?.
	self encodeQueryFields: self query on: stream