accessing
at: key ifAbsent: block
	"Return the value of key as stored on the server, evaluating block when not found"

	^ [ self httpClient get: 'kvstore/', key asString ]
			on: ZnHttpUnsuccessful
			do: [ :exception |
				exception response isNotFound
					ifTrue: block
					ifFalse: [ exception pass ] ]