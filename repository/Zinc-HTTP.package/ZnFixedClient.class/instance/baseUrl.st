accessing
baseUrl
	"Return the base or fixed URL that we talk to"
	
	^ ZnUrl new 
		scheme: self scheme; 
		host: self host; 
		port: self port; 
		yourself 