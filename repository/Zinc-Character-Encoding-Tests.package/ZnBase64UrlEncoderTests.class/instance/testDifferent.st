tests
testDifferent
	| encoder jsonb64 json |
	jsonb64 := 'eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ'.
	json := '{"kid":"rsa1","alg":"RS256"}'. "This is the decoded JSON string."
	encoder := ZnBase64Encoder new.
	self 
		should: [ encoder decode: jsonb64 ]
		raise: ZnCharacterEncodingError.
	encoder := ZnBase64UrlEncoder	new.
	self
		assert: (encoder decode: jsonb64) 
		equals:  json asByteArray 