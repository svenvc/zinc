actions
getAuthenticationRequestUrl: aReturnToUrl do: aBlock
	"Answer a URL to the OpenID authentication page."
	
	| request url |
	
	self isAssociationValid 
		ifFalse: [ self setupAssociation ].
		
	request := ZnOpenIDAuthRequest new
		modeCheckidSetup;
		assocHandle: self assocHandle;
		returnTo:  aReturnToUrl asString.
	self realm notNil
		ifTrue: [ request realm: self realm ].
	aBlock value: request.

	url := endpoint copy.
	request addToUrl: url.
	^url