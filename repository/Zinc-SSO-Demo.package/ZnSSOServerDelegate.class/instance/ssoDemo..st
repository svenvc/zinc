responses
ssoDemo: request
	| html session service token |
	html := self
		htmlPageTitled: 'Zinc SSO Demo'
		do: [ :stream | 
			stream << '<h2>OAuth2 Providers</h2>'.
			#(#Google #Facebook )
				do: [ :each |
					session := self perform: (each asLowercase, 'SessionFor:') asSymbol with: request.
					stream
						<< '<a href="';
						<< session authenticationUrl asString;
						<< '" title="Login with ';
						<< each;
						<< '">';
						<< each;
						<< '</a>' ]
				separatedBy: [ stream << ' | ' ].
			stream << '<h2>OAuth1 Providers</h2>'.
			service := self twitterOAuth1Service.
			token := service getRequestTokenFor: request server url / 'sso-twitter-callback'.
			self twitterSessionFor: request put: token.
			stream
				<< '<a href="';
				<< (service loginUrlFor: token) asString;
				<< '" title="Login with ';
				<< #Twitter;
				<< '">';
				<< #Twitter;
				<< '</a>'.
			stream << '<h2>OpenID Providers</h2>'.
			#( Google Yahoo ) 
				do: [ :each |
					stream
						<< '<a href=''sso-openid?provider=' ;
						<< each ;
						<< ''' title=''Login with ' ;
						<< each ;
						<< '''>' ;
						<< each ;
						<< '</a>' ]
				separatedBy: [ stream << ' | ' ].
			stream << '<h4>May the Source be with you!</h4>' ].
	^ ZnResponse ok: (ZnEntity html: html)