public
get: url
	"Access the shared web workspace at url 
	and return its contents as a String.
	Signals an error when something goes wrong."
	
	| contents |
	contents := self httpClient get: url.
	^ String new: contents size streamContents: [ :stream |
		contents linesDo: [ :each | stream nextPutAll: each; cr ] ]