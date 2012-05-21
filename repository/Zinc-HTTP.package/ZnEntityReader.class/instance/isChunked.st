testing
isChunked
	| transferEncoding |
	transferEncoding := self headers at: 'Transfer-Encoding' ifAbsent: [ ^ false ].
	^ transferEncoding beginsWith: 'chunked'