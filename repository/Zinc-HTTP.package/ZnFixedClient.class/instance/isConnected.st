testing
isConnected
	^ connection notNil and: [ 
		connection isConnected and: [ 
			connection isOtherEndConnected ] ]