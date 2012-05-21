printing
printQueryOn: stream
	stream nextPut: $?. 
	ZnUtils writeQueryFields: self query on: 	stream