private
httpClient
	httpClient isNil
		ifTrue: [ self endPoint: self standardEndPoint ].
	^ httpClient