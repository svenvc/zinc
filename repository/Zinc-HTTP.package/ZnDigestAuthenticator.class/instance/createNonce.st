private
createNonce
	| pt |
	pt := TimeStamp current asString, ':', Random new next asString.
	^ self class md5Hash: pt