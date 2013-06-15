rendering
renderOpenID2SignInOptions: aCallbackUrl on: html

	html heading
		level2;
		with: 'OpenID2 providers:'.

	html div: [
		self openIDSingleSignOn providers do: [ :each |
			self renderAnchor:  [ self signOnUsingOpenID2: each name callbackUrl: aCallbackUrl ]
				title: each altText
				imageUrl: each imgUrl
				on: html ] ]