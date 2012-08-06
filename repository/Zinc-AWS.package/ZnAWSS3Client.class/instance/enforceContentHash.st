private protocol
enforceContentHash
	| etag md5 request  |
	request := self httpClient request.
	request hasEntity ifFalse: [ ^ self ].
	(etag := self eTag) ifNil: [ ^ self ].
	md5 := self md5: request contents.
	etag = md5 hex
		ifFalse: [ self error: 'Content MD5 hash and ETag do not match' ]