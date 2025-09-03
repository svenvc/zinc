testing - external
testRedirectDontFollow
	| client target |
	target := 'http://zn.stfx.eu'.
	(client := self httpClient)
		dontFollowRedirects;
		get: target.
	self assert: client response isRedirect.
	client
		enforceHttpSuccess: true;
		get: target.
	self assert: client response isRedirect.
	client close