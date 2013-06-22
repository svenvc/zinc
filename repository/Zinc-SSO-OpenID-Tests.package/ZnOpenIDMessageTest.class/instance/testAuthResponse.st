testing
testAuthResponse

	| url response assocResponse |
	
	url := self authenticationResultUrl asZnUrl.
	response := ZnOpenIDAuthResponse newFromUrl: url.
	
	self assert: (response axValueEmail = 'jvdsandt@gmail.com').
	self assert: (response signedText = self authenticationResultSignedText).

	assocResponse := ZnOpenIDAssociationResponse newFromKeyValueForm: self associationResult.
	self assert: (assocResponse sign: response signedText andCheck: response sig)
