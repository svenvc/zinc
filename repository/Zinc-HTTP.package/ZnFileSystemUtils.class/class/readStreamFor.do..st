streams
readStreamFor: fileName do: block
	^ fileName asFileReference 
		readStreamDo: block
		ifAbsent: [ FileDoesNotExist signalWith: fileName asFileReference ]