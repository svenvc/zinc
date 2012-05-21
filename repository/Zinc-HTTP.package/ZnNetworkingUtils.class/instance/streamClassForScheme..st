private
streamClassForScheme: scheme
	scheme = #http ifTrue: [ 
		^ self socketStreamClass ].
	scheme = #https ifTrue: [ 
		^ self secureSocketStreamClass ifNil: [
			self error: 'No secure socket stream class set or available' ] ].
	(ZnUnknownScheme scheme: scheme) signal