rendering
renderOpenIDConnectProviders: aCallbackUrl on: html

	html heading
		level2 ;
		with: 'OpenID Connect providers'.

	html div 
		style: 'float: left;' ;
		with: [ 
			html anchor
				callback: [ self signOnUsingOpenIDConnectGoogle: aCallbackUrl ] ;
				with: 'Google'.
			html text: ' | ' ].

	html form
		style: 'float: left; padding-left: 8px; padding-bottom: 8px;' ;
		with: [ 
			html label
				for: html nextId ;
				with: 'Google Apps domain: '.
			html textInput 
				id: html lastId ;
				on: #hostedDomain of: self.
			html submitButton 
				callback: [ self signOnUsingOpenIDConnectGoogle: aCallbackUrl domain: self hostedDomain ] ;
				with: 'Go' ]