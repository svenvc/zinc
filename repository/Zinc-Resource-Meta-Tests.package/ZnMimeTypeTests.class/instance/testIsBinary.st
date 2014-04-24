testing
testIsBinary
	self assert: ZnMimeType applicationOctetStream isBinary.
	self assert: ZnMimeType imagePng isBinary.
	self deny: ZnMimeType textPlain isBinary.
	self deny: ZnMimeType textHtml isBinary.
	self deny: ZnMimeType textJavascript isBinary.
	self deny: ZnMimeType applicationJson isBinary.
	#( 'text/plain;charset=ascii' 'application/json;charset=utf-8'
	   'application/vnd.com.runkeeper.user+json;charset=ISO-8859-1'
		'application/xml-dtd' 'application/xslt+xml' ) do: [ :each |
		self deny: each asZnMimeType isBinary ]