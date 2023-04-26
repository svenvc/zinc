testing
testReading
	| requestLine string |
	string := 'GET /foo/bar/xyz.txt HTTP/1.1' , String crlf.
	requestLine := ZnRequestLine readFrom: string readStream.
	self assert: requestLine method equals: #GET.
	self assert: requestLine uriPathQueryFragment equals: '/foo/bar/xyz.txt'.
	self assert: requestLine version equals: ZnConstants defaultHTTPVersion