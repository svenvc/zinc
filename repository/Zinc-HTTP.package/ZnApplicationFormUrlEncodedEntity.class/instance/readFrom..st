initialize-release
readFrom: stream
	"We parse from stream, limited to content length if available."

	| rawStream readStream |
	representation := nil.
	rawStream := contentLength
		ifNil: [ stream ]
		ifNotNil: [ ZnLimitedReadStream on: stream limit: contentLength ].
	readStream := ZnCharacterReadStream on: rawStream encoding: 'ascii'.
	fields := ZnResourceMetaUtils parseQueryFrom: readStream