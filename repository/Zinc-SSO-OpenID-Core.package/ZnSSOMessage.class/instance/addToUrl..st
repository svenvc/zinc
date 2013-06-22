actions
addToUrl: anUrl
	"Add the receivers properties as parameters to ==anUrl==."
	
	self properties keysAndValuesDo: [ :key :value | anUrl queryAt: key put: value ]