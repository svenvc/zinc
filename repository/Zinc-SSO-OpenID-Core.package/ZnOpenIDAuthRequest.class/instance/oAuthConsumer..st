accessing oauth
oAuthConsumer: aString

	self nsOAuth: self class nsOAuth.
	self propertyAt: 'openid.oauth.consumer' put: aString