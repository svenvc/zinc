public
handleGetKey: request
	"Handle GET /kvstore/sone-key returing either the value or a 404 Not Found"

	^ access critical: [
			data
				at: request uri pathSegments second
				ifPresent: [ :value | ZnResponse ok: (ZnEntity text: value) ]
				ifAbsent: [ ZnResponse notFound: request uri ] ]