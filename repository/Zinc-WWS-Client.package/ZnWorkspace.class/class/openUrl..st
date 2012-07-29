instance creation
openUrl: url
	"Open a new workspace with the contents of the resource at url."
	
	"self openUrl: 'http://ws.stfx.eu/1WS4U'' "
	
	^ self new
		open;
		openUrl: url;
		yourself