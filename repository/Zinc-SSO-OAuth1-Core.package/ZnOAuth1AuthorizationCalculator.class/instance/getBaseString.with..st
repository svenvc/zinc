actions
getBaseString: aRequest with: anOAuthParameters
	"Create the OAuth1 baseString"

	| params paramsString percentEncoder |
	
	percentEncoder := ZnPercentEncoder new.
	
	params := OrderedCollection new
		addAll: anOAuthParameters ;
		yourself.
	aRequest mergedFields keysAndValuesDo:  [ :key :value | params add: key -> value ].
	
	params sort: [ :a1 :a2 |
		a1 key = a2 key
			ifTrue: [ a1 value < a2 value ]
			ifFalse: [ a1 key < a2 key ] ].
		
	paramsString := String streamContents: [ :stream |
		params 
			do: [ :assoc |
				stream
					nextPutAll: assoc key ;
					nextPut: $=.
				percentEncoder encode: assoc value readStream to: stream ]
			separatedBy: [ stream nextPutAll: '&' ] ].
		
	^String streamContents: [ :stream | | baseUrl |
		stream
			nextPutAll: aRequest method ;
			nextPut: $&.
		baseUrl := aRequest uri copy
			query: nil ;
			fragment: nil ;
			asString.
		percentEncoder encode: baseUrl readStream to: stream. 	
		stream nextPut: $&.
		percentEncoder encode: paramsString readStream to:  stream ]