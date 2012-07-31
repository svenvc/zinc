proxy
isProxyAuthorizationRequired
	"Does the proxy require authorization ?"
	
	^ self isProxySet and: [ HTTPSocket proxyCredentials notNil ]