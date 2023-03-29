streams
oldFileNamed: fileName do: block
	^ fileName asFileReference
		readStreamDo: block
		ifAbsent: [ FileDoesNotExistException signalWith: fileName asFileReference ]