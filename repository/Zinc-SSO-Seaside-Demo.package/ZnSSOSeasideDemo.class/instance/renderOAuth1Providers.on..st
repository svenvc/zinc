rendering
renderOAuth1Providers: aCallbackUrl on: html

	html heading
		level2 ;
		with: 'OAuth1 providers'.

	html anchor
		callback: [ self signOnUsingOAuth1Twitter: aCallbackUrl ] ;
		with: [
			html image
				url: (ZnSSOSeasideDemoFileLibrary urlOf: #ssoTwitterGrayPng ) ;
				title: ' Sign in with Twitter' ]