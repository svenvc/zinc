accessing
at: key
	"Return the value of key as stored on the server, raising a KeyNotFound when necessary"

	^ [ self httpClient get: 'kvstore/', key asString ]
			on: ZnHttpUnsuccessful
			do: [ :exception |
				exception response isNotFound
					ifTrue: [ KeyNotFound signalFor: key ]
					ifFalse: [ exception pass ] ]