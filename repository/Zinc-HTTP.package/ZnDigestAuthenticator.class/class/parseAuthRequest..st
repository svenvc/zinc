accessing
parseAuthRequest: aHeader
	| data dict |
	dict := Dictionary new.
	data := aHeader copyFrom: 8 to: aHeader size.
	(data subStrings: ',') do: [ :fragment | | tokens i key value |
		tokens := fragment trimBoth.
		i := tokens indexOf: $=.
		(i > 0) ifTrue: [
			key := tokens copyFrom: 1 to: i - 1.
			value := tokens copyFrom: i + 1 to: tokens size.  
			dict at: key put: (value copyFrom: 2 to: value size - 1) ] ].
	^ dict