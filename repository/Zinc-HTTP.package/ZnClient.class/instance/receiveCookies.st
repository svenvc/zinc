private
receiveCookies
	response cookies do: [ :each |
		each defaultDomain: request url host.
		self session cookieJar add: each.
		self log debug: [ 'Received cookie: ', each printString ]  ]