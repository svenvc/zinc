as yet unclassified
localUrl
	"Return a ZnUrl to access me."
	
	^ ZnUrl new
		scheme: #http;
		host: (GsSocket getHostAddressByName: 'localhost');
		port: self port;
		yourself