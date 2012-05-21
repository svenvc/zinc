testing
testParsingWrongScheme
	self should: [ ZnUrl fromString: 'htttp://foo:bar' ] raise: ZnUnknownScheme 