initialize-release
readFrom: stream

	"We parse from stream, limited to content length if available."

	| readStream |
	representation := nil.
	readStream := contentLength
		ifNil: [  ZnCharacterReadStream on: stream encoding: 'ascii' ]
		ifNotNil: [ (ZnLimitedReadStream on: stream limit: contentLength) ascii ].
	fields := ZnResourceMetaUtils parseQueryFrom: readStream