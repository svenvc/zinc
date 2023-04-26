testing
acceptsEncodingGzip
	| value |
	value := self headers singleAt: 'Accept-Encoding' ifAbsent: [ ^ false ].
	^ value includesSubstring: 'gzip'