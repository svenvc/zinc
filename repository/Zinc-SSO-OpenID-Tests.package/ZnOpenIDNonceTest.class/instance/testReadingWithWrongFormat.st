tests
testReadingWithWrongFormat

	self should: [ self nonceFromString: '2011-1225T17:15:41Z' ] raise: ZnOpenIDNonceInvalidError.
	self should: [ self nonceFromString: 'asdasd' ] raise: ZnOpenIDNonceInvalidError.
	self should: [ self nonceFromString: '2011-11-23T11:48:19' ] raise: ZnOpenIDNonceInvalidError