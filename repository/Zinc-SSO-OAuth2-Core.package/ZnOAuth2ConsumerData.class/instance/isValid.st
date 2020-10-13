testing
isValid 
	^ key isEmptyOrNil not 
		& secret isEmptyOrNil not 
		& redirectUrl isEmptyOrNil not.