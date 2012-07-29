streams
oldFileStreamFor: fileName
	^fileName asFileReference 
		readStreamIfAbsent: [ self error: fileName asString, ' does not exists' ]