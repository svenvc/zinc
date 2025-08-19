testing - external
testVerifyCertificate
	| url |
	url := 'https://expired-rsa-ev.ssl.com/' asZnUrl.

	self assert: (ZnClient new get: url; isSuccess).

	self 
		should: [ 
			ZnOptions globalDefault clone
				at: #verifyCertificates put: true;
				during: [ ZnClient new get: url ] ]
		raise: ZnCertificateVerificationFailed