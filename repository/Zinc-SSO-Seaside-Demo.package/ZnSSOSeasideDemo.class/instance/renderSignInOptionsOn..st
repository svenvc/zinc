rendering
renderSignInOptionsOn: html

	| callback url |

	callback := WAActionCallback on: [ self handleCallback ] .
	url := html actionUrl copy addField: (html callbacks store: callback).
	url takeServerParametersFromRequest: self requestContext request.

	self renderOAuth2Providers: url on: html.
	html horizontalRule.
	self renderOAuth1Providers: url on: html.
	html horizontalRule.
	self renderOpenID2SignInOptions: url on: html.
	html	horizontalRule
		style: 'clear: both;' 

	