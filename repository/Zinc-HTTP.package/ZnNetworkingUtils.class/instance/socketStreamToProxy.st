private
socketStreamToProxy
	| proxyUrl |
	"System settings do currently not support HTTPS proxies."
	(proxyUrl := ZnUrl new) 
		scheme: #http; 
		host: self httpProxyServer; 
		port: self httpProxyPort.
	^ self socketStreamToUrlDirectly: proxyUrl