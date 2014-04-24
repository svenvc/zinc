convenience
installInServer: server
	"Install the demo application in a ZnServer with a ZnDefaultServerDelegate"
	
	server delegate
		map: 'sse-status-client'
		to: [ :request | ZnResponse ok: (ZnEntity html: self clientHtml) ];
		map: 'sse-status'
		to: self new