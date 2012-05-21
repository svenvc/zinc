accessing
portOrDefault
	^ self hasPort
		ifTrue: [ self port ]
		ifFalse: [ self class defaultPortForScheme: self schemeOrDefault ]