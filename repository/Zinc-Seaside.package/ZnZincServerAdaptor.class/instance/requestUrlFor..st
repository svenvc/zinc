converting
requestUrlFor: aZincRequest
	^ (WAUrl absolute: aZincRequest uri greaseString)
		decodedWith: self codec.