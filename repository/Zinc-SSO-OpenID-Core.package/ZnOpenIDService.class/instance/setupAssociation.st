initialize-release
setupAssociation

	"
		openid.ns:http://specs.openid.net/auth/2.0
		openid.mode:associate
		openid.session_type:no-encryption
		openid.assoc_type:HMAC-SHA1	"

	| url response |
	
	endpoint isNil
		ifTrue: [ self error: 'endpoint undefined' ].
	
	url := endpoint copy.
	ZnOpenIDAssociationRequest new addToUrl: url.
	response := self httpClient 
		url: url ;
		get ;
		response.
	
	response isSuccess
		ifFalse: [ self error: 'Failed to setup association' ].
	
	associationResponse := ZnOpenIDAssociationResponse newFromKeyValueForm: response contents.
	associationExpireTime := self dateAndTimeNow + (Integer readFrom: associationResponse expiresIn readStream) seconds.
