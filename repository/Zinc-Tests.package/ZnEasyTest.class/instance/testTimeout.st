testing
testTimeout
	self withServerDo: [ : server |
		self
			should: [
				ZnOptions globalDefault clone
					at: #socketStreamTimeout put: 1; 
					during: [ ZnEasy get: (server localUrl addPathSegment: 'echo'; queryAt: 'delay' put: '2'; yourself) ] ]
			raise: ConnectionTimedOut ]