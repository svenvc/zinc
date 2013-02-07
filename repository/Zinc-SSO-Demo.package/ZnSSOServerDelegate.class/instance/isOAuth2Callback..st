testing
isOAuth2Callback: aRequest

	^aRequest uri queryKeys includes: 'code'