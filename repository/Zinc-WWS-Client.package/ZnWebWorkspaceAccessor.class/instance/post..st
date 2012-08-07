public
post: string
	"Publish the string as a new shared web workspace
	and return the newly created url.
	Signals an error when something goes wrong."
	
	| entity client url |
	entity := ZnEntity text: string asString.
	(client := self httpClient)
		entity: entity; 
		post.
	url := client response location.
	^ url asZnUrl inContextOf: self endpoint 