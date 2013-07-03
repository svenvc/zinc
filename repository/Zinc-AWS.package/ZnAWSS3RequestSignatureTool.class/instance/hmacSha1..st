private
hmacSha1: string
	^ (HMAC on: SHA1 new)
		key: self secretAccessKey asByteArray;
		digestMessage: string asByteArray