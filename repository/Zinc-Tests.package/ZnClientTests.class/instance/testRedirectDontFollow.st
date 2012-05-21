testing
testRedirectDontFollow
	| client |
	(client := ZnClient new) 
		dontFollowRedirects;
		get: 'http://www.pharo-project.org'.
	self assert: client response isRedirect.
	client
		enforceHttpSuccess: true;
		get: 'http://www.pharo-project.org'.
	self assert: client response isRedirect.
	client close