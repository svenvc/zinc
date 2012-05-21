accessing
localUrl
	"Return a ZnUrl to access me."
	
	^ ZnUrl new
		scheme: #http;
		host: NetNameResolver loopBackName;
		port: self port;
		yourself