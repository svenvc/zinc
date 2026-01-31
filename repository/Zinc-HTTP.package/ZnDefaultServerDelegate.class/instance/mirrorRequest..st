responses
mirrorRequest: request
	"Mirror request by sending the incoming payload, if present, back"

	^ request hasEntity
		ifTrue: [ ZnResponse ok: request entity ]
		ifFalse: [ ZnResponse ok: (ZnEntity text: String empty) ]