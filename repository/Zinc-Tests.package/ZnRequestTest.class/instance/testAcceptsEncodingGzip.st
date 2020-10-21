tests
testAcceptsEncodingGzip
	| request |
	request := ZnRequest new.
	request setAcceptEncodingGzip.
	self assert: request acceptsEncodingGzip