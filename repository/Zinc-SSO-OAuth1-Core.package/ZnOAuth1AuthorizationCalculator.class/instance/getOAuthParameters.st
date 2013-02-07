actions
getOAuthParameters

	| list |
	
	list := OrderedCollection new
		add: 'oauth_consumer_key' -> self consumerKey ;
		add: 'oauth_nonce' -> self nonce ;
		add: 'oauth_signature_method' -> self signatureMethod ;
		add: 'oauth_timestamp' -> self timestamp ;
		add: 'oauth_version' -> self version ;
		yourself.
		
	self token notNil
		ifTrue: [ list add: 'oauth_token' -> self token ].
	self callback notNil
		ifTrue: [ list add: 'oauth_callback' -> self callback asString ].
	self verifier notNil
		ifTrue: [ list add: 'oauth_verifier' -> self verifier ].
	^ list