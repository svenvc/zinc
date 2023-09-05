tests
testBack
	"Check that ZnBufferedReadStream>>#back behaves as expected"
	<gtExample>
	| stream source |

	"Allocate a buffer larger than the default size (65536)"
	self assert: ZnBufferedReadStream basicNew defaultBufferSize < 66000.
	source := ByteArray new: 70000.
	1 to: 70000 do: [ :i |
		source at: i put: i \\ 256 ].

	stream := ZnBufferedReadStream on: source readStream.
	stream position: 1.
	self assert: stream peek equals: (source at: 2).
	self assert: stream back equals: (source at: 1).
	"Position the stream beyond the end of the initial buffer"
	stream position: 66000.
	self assert: stream peek equals: (source at: 66001).
	self assert: stream back equals: (source at: 66000).