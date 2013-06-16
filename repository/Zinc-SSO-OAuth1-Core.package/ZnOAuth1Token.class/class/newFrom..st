instance creation
newFrom: aString

	^self newFromDictionary: (ZnResourceMetaUtils parseQueryFrom: aString readStream)