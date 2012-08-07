private
httpClient
	httpClient isNil ifTrue: [ self initializeHttpClient ].
	^ httpClient