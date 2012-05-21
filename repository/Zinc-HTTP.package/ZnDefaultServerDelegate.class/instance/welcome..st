responses
welcome: request
	"Answer a nice HTML welcome page"
	
	| html entity |
	html := ZnConstants welcomePageHtml copy 
		replaceAll: Character cr with: Character lf.
	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity