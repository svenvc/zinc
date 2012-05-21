testing
isConnectionReusable
	^ connection notNil and: [ 
		lastUsed notNil
			and: [ TimeStamp now <= (lastUsed + self maxKeepAlive) ] ]