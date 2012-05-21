operations
fixedUrl: uri
	"Accept either a string that we parse, or a ZnURL object,
	and make sure it points to the fixed scheme://host:port that we talk too.
	This is necessary because we try to reuse the connection."
	
	| url |
	url := uri asZnUrl.
	self host ifNil: [ self error: 'Host has not been set' ].
	url
		scheme: self scheme;
		host: self host;
		port: self port.
	^ url