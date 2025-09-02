private
generateEchoRequestString: request
	"Generate a string echoing the request"

	^ String streamContents: [ :stream |
		stream nextPutAll: 'This is Zinc HTTP Components echoing your request.'; crlf.
		stream nextPutAll: 'Running '; print: request server; crlf.
		stream nextPutAll: request method; space.
		request uri printPathQueryFragmentOn: stream.
		stream space; nextPutAll: request requestLine version.
		stream crlf; nextPutAll: 'Headers'; crlf.
		request headersDo: [ :key :value |
			stream space; nextPutAll: key; nextPutAll: ': '; nextPutAll: value; crlf ].
		request hasEntity ifTrue: [
			stream nextPutAll: ' containing '; print: request entity ] ]