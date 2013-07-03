private
authorizationFor: request
	| canonicalString hmac |
	request headers at: 'Date' put: ZnUtils httpDate.
	canonicalString := self canonicalStringFor: request.
	hmac := self hmacSha1: canonicalString.
	^ ZnUtils encodeBase64: hmac