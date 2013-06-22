rendering
renderOAuth2Providers: aCallbackUrl on: html

	html heading
		level2 ;
		with: 'OAuth2 providers'.

	html anchor
		callback: [ self signOnUsingOAuth2Facebook: aCallbackUrl ] ;
		with: 'Facebook'.
	html text: ' | '.
	html anchor
		callback: [ self signOnUsingOAuth2Google: aCallbackUrl ] ;
		with: 'Google'.
	html text: ' | '.
	html anchor
		callback: [ self signOnUsingOAuth2Microsoft: aCallbackUrl ] ;
		with: 'Microsoft'