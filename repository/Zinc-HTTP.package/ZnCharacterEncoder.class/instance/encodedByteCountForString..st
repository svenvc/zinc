convenience
encodedByteCountForString: string
	^ string 
		inject: 0 
		into: [ :sum :each |
			sum + (self encodedByteCountFor: each) ]