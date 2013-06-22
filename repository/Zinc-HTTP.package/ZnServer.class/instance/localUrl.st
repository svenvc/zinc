accessing
localUrl
	"Return a ZnUrl to access me."
	
	^ ZnUrl new
		scheme: self scheme;
		host: 'localhost';
		port: self port;
		yourself