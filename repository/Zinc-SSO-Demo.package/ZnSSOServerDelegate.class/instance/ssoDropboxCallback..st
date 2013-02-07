responses
ssoDropboxCallback: request

	| requestToken oauthToken accessToken |

	requestToken := self dropboxSessionFor: request 
		ifAbsent:  [ ^ self generateInvalidCallbackRequest ].

	oauthToken := request uri queryAt: 'oauth_token' ifAbsent: [ nil ].
	
	(oauthToken notNil and: [ oauthToken ~= requestToken value ])
		ifTrue: [ ^ self generateInvalidCallbackRequest ].
	
	accessToken := self dropboxOAuth1Service getAccessToken: requestToken.
	self dropboxSessionFor: request put: accessToken. 

	^ ZnResponse redirect: 'sso-dropbox-data'