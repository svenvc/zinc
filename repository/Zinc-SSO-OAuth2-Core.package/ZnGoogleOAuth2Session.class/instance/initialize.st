initialize-release
initialize
	super initialize.
	self beOnlineAccessType.
	self beNonePrompt.
	self authorizationEndpoint: 'https://accounts.google.com/o/oauth2/v2/auth'.
	self tokenEndpoint: 'https://oauth2.googleapis.com/token'.