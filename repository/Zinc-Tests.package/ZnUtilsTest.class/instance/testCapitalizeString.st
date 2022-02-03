testing
testCapitalizeString
	self assert: (ZnUtils capitalizeString: 'content-type') equals: 'Content-Type'.
	self assert: (ZnUtils capitalizeString: 'CONTENT-type') equals: 'Content-Type'.
	self assert: (ZnUtils capitalizeString: 'content-TYPE') equals: 'Content-Type'.
	self assert: (ZnUtils capitalizeString: 'WWW-Authenticate') equals: 'Www-Authenticate'.
	self assert: (ZnUtils capitalizeString: 'Content-MD5') equals: 'Content-Md5'