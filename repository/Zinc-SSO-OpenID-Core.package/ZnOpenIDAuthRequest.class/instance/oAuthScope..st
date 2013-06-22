accessing oauth
oAuthScope: aString

	self nsOAuth: self class nsOAuth.
	self propertyAt: 'openid.oauth.scope' put: aString