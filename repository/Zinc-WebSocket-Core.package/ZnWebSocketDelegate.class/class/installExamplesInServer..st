examples
installExamplesInServer: znServer
	"Install the WebSocket examples in znServer, provided it has a ZnDefaultServerDelegate"
	
	znServer delegate
	     map: 'ws-demo'
		to: [ :request | ZnResponse ok: (ZnEntity html: self demoHtml) ];
		map: 'ws-echo-client-remote' 
		to: [ :request | ZnResponse ok: (ZnEntity html: ZnWebSocketEchoHandler clientHtmlRemote) ];
		map: 'ws-echo-client' 
		to: [ :request | ZnResponse ok: (ZnEntity html: ZnWebSocketEchoHandler clientHtml) ];
		map: 'ws-echo'
		to: (self map: 'ws-echo' to: ZnWebSocketEchoHandler new);
		map: 'ws-chatroom-client' 
		to: [ :request | ZnResponse ok: (ZnEntity html: ZnWebSocketChatroomHandler clientHtml) ];
		map: 'ws-chatroom'
		to: (self map: 'ws-chatroom' to: ZnWebSocketChatroomHandler new);
		map: 'ws-status-client' 
		to: [ :request | ZnResponse ok: (ZnEntity html: ZnWebSocketStatusHandler clientHtml) ];
		map: 'ws-status'
		to: (self map: 'ws-status' to: ZnWebSocketStatusHandler new)