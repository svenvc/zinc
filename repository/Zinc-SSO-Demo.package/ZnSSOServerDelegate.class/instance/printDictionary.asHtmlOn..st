private
printDictionary: aDictionary asHtmlOn: aStream

	aStream
		nextPutAll: '<ul>'.
	aDictionary keysAndValuesDo: [ :key :value |
		aStream
			nextPutAll: '<li>' ;
			nextPutAll: key.
		value isDictionary
			ifTrue: [ self printDictionary: value asHtmlOn: aStream ]
			ifFalse: [
				aStream
					nextPutAll: ' --> ' ;
					nextPutAll: value asString ].
		aStream nextPutAll: '</li>' ].
	aStream nextPutAll: '</ul>'