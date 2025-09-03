options
maximumNumberOfDictionaryEntries: anInteger
	"Set the maximum number of entries allowed in ZnMutliValueDictionaries before signalling ZnTooManyDictionaryEntries. This protects us from overflow attacks."

	self localOptions at: #maximumNumberOfDictionaryEntries put: anInteger