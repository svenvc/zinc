accessing
limit
	^ limit ifNil: [ limit := ZnConstants maximumNumberOfDictionaryEntries ]