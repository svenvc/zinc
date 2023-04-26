streams
oldFileStreamFor: fileName
	^ fileName asFileReference
		readStreamIfAbsent: [ FileDoesNotExistException signalWith: fileName asFileReference ]