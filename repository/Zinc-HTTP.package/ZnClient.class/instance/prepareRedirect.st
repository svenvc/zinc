private protocol
prepareRedirect
	"We implement the common behavior that POST/PUT redirects turn into GET request.
	Note also that the body data is dropped, as well as the cookie handling."

	| targetUrl |
	targetUrl := self redirectUrl.
	self noteRedirect: targetUrl.
	self receiveCookies.
	(#(POST PUT) includes: request method)
		ifTrue: [ self method: #GET ].
	request hasEntity
		ifTrue: [ request resetEntity: nil ].
	self url: targetUrl.
	self sendCookies