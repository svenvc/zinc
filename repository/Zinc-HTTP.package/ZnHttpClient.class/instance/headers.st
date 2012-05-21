accessing
headers
	^ headers ifNil: [ headers := ZnMultiValueDictionary new ]