actions
getRequestTokenFor: aCallbackUrl with: extraParameters
	"The first step is to get a token and token_secret for <aCallbackUrl>.
	Version 1.0a of OAuth requires a callback url. "

	| calculator request response responseProperties |

	calculator := self providerAccount newCalculator
		callback: aCallbackUrl ;
		yourself.
	
	request := ZnRequest get: self providerAccount getRequestTokenUrl.
	extraParameters notNil
		ifTrue: [ extraParameters keysAndValuesDo: [ :key :value | request uri queryAt: key put: value ] ].
	request
		setAccept: '*/*' ;
		setAuthorization: (calculator getAuthorizationHeader: request).

	response := self httpClient
		request: request ;
		execute ;
		response.
		
	response isSuccess 
		ifFalse: [ self error: 'Invalid response' ].

	responseProperties := response contents.
	responseProperties isString
		ifTrue: [ responseProperties := self resourceMetaUtils parseQueryFrom: responseProperties readStream ].
	(aCallbackUrl notNil and: [ (responseProperties at: 'oauth_callback_confirmed') ~= 'true' ])
		ifTrue: [ self error: 'Callback not confirmed' ].
		
	^ZnOAuth1Token newFromDictionary: responseProperties