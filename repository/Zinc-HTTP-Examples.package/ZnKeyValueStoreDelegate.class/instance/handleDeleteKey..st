public
handleDeleteKey: request
	"Handle DELETE /kvstore/sone-key returing either the URI or a 404 Not Found"

	access critical: [
		data
			removeKey: request uri pathSegments second
			ifAbsent: [ ^ ZnResponse notFound: request uri ].
		^ ZnResponse ok: (ZnEntity text: request uri asString) ]