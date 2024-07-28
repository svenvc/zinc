I am a ZnDelegate that acts as a proxy.

I handle requests by passing them to a proxyBlock which can change the request before I execute it.
The idea is that the changed request is to a different server, the one that we proxy.

Usage example

	| proxiedServer proxyServer proxyDelegate client  |
	proxiedServer := ZnServer startOn: 8080.
	proxyServer := ZnServer on: 9090.
	proxyDelegate := ZnProxyServerDelegate new
		server: proxyServer;
		proxyBlock: [ :request | 
			request url: (request url port: 8080) ].
	proxyServer
		delegate: proxyDelegate;
		start.
	client := ZnClient new.
	client get: proxyServer url / #echo.
