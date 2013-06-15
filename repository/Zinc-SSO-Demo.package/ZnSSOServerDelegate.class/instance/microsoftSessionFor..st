accessing-session
microsoftSessionFor: aRequest
	^ aRequest session 
		attributeAt: 'microsoft-session' 
		ifAbsentPut: [ ZnOAuth2Session microsoft: self microsoftData ]