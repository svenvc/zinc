public
socketStreamToUrlDirectly: url
	| stream |
	stream := (self streamClassForScheme: url scheme) 
		openConnectionToHostNamed: url host
		port: url portOrDefault.  
	self setSocketStreamParameters: stream.  
	url isHttps ifTrue: [ stream connect ].  
	^ stream