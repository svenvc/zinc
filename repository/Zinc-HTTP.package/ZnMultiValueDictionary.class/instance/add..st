adding
add: anAssociation
	"Overridden to signal an exception when the limit, if present, is exceeded."
	
	| index element |
	index := self findElementOrNil: anAssociation key.
	element := array at: index.
	element == nil
		ifTrue: [
			(self limit notNil and: [ self size >= self limit ])
				ifTrue: [ (ZnTooManyDictionaryEntries limit: self limit) signal ].
			self atNewIndex: index put: anAssociation ]
		ifFalse: [
			element value: anAssociation value ].
	^ anAssociation