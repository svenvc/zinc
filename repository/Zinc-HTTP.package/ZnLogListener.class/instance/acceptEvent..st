private
acceptEvent: logEvent
	filter isNil ifTrue: [ ^ true ].
	filter isSymbol ifTrue: [ ^ logEvent category = filter ].
	^ filter value: logEvent category  