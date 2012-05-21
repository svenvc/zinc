public
isAuthorizationValid: authorization
	^ authorization isNil
		or: [ authorization key isEmptyOrNil not 
			and: [ authorization value isEmptyOrNil not ] ]