private protocol
addContentHash
	| md5 |
	self httpClient request hasEntity ifFalse: [ ^ self ].
	md5 := self md5: self httpClient request contents.
	self httpClient headerAt: 'Content-MD5' put: (ZnUtils encodeBase64: md5)


