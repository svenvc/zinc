rendering
renderContentOn: html

	html heading
		with: 'About'.
		
	html paragraph: [
		html text: 'This is a simple demo application that shows the functionality of Zinc-SSO. '.
		html text: 'Documentation is available on  '.
		html anchor
			url: 'https://github.com/svenvc/docs/blob/master/zinc/zinc-sso-paper.md' ;
			with: 'GitHub'.
		html text: '.' ].
	
	html paragraph: [
		html emphasis: '(Please note that Zinc-SSO is currently in development. This is alpha code.) ' ]