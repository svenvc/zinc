private
createOpaque
	| pt |
	pt := Random new next asString, ':', TimeStamp current asString.
	^ self class md5Hash: pt