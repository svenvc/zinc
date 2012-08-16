accessing
checkIntegrity
	"Do I check the integrety of get/put requests using content hashes ?"
	
	checkIntegrity isNil ifTrue: [ checkIntegrity := false ].
	^ checkIntegrity