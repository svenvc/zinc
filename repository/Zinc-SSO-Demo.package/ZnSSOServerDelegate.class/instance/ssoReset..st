responses
ssoReset: request
	| target |
	self resetSessions: request.
	target := request uri queryAt: #target ifAbsent: [ 'sso-demo' ].
	^ ZnResponse redirect: target