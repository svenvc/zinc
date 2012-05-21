private protocol
prepareRequest
	state := #inProgress.
	self isOneShot 
		ifTrue: [ request setConnectionClose ].
	request hasEntity
		ifTrue: [ 
			"This is necessary because entities are often modified after first being added empty,
			and a wrong content length is cached at the request level"
			request resetEntity: request entity ].
	self sendCookies 