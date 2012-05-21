initialize-release
initialize
	super initialize.
	self settings at: #agent put: self class defaultUserAgentString.
	self followRedirect: true.
	self redirectLimit: 7.
	self timeout: 180