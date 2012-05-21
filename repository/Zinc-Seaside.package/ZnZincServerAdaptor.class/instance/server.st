accessing
server
	"Return the ZnServer running me, create a default one if missing"
	
	^ server ifNil: [ server := self defaultZnServer ]