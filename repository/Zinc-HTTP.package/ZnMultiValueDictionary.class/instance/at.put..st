accessing
at: key put: anObject
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject.
	Overridden to signal an exception when the limit, if present, is exceeded."

	| index assoc |
	index := self findElementOrNil: key.
	assoc := array at: index.
	assoc
		ifNil: [
			(self limit notNil and: [ self size >= self limit ])
				ifTrue: [ (ZnTooManyDictionaryEntries limit: self limit) signal ].
			self atNewIndex: index put: (Association key: key value: anObject) ]
		ifNotNil: [
			assoc value: anObject ].
	^ anObject