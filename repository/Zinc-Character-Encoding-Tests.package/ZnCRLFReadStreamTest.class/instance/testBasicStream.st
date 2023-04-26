tests
testBasicStream

	| lines input output |

	lines := #('Line 1' 'Line 2' 'Line 3').
	input := String streamContents: [ :stream |
		stream
			<< lines first;
			<< String cr;
			<< lines second;
			<< String lf;
			<< lines third;
			<< String crlf ].
	output := String streamContents: [ :stream |
		stream
			<< lines first;
			<< String crlf;
			<< lines second;
			<< String crlf;
			<< lines third;
			<< String crlf ].
	self
		assert: (ZnCRLFReadStream on: input asByteArray readStream) upToEnd
		equals: output asByteArray