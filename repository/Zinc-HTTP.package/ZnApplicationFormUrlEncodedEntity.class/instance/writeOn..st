writing
writeOn: stream
	"In most use cases, contentLength will have been asked first so that a representation is cached,
	there probably is no need to cache the representation generated here"
	
	representation isNil
		ifTrue: [ self writeRepresentationOn: stream ] 
		ifFalse: [ stream nextPutAll: representation ] 