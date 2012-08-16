initialize-release
close
	"Close the network resources we are using"
	
	httpClient notNil 
		ifTrue: [ httpClient close ]