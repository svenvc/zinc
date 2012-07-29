streams
oldFileNamed: fileName do: block
	^ fileName asFileReference 
		readStreamDo: block
		ifAbsent: [ self error: fileName asString, ' does not exists' ]