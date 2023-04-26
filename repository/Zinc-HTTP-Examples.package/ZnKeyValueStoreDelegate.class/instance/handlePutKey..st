public
handlePutKey: request
	"Handle PUT /kvstore/sone-key returing either the value.
	The value is the contents of the entity, assumed to be text/plain"

	access critical: [
		data
			at: request uri pathSegments second
			put: request entity contents ].
	^ ZnResponse ok: (ZnEntity text: request entity contents)