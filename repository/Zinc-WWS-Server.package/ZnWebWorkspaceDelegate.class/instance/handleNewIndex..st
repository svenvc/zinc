private request handling
handleNewIndex: request
	| html captcha |
	captcha := self generateCaptcha: request.
	html := self generateNewPage format: { #captcha -> captcha } asDictionary.
	^ ZnResponse ok: (ZnEntity html: html)