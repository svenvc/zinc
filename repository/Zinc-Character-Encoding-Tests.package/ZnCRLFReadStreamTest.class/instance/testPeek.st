tests
testPeek

	| input stream |

	input := String streamContents: [ :str |
		str
			<< 'a';
			<< String cr;
			<< 'b';
			<< String lf;
			<< 'c';
			<< String crlf ].
	stream := ZnCRLFReadStream on: input asByteArray readStream.
	self
		assert: stream peek
		equals: $a asInteger.
	self
		assert: stream next
		equals: $a asInteger.
	self
		assert: stream next
		equals: Character cr asInteger.
	self
		assert: stream peek
		equals: Character lf asInteger.
	self
		assert: stream next
		equals: Character lf asInteger.
	self
		assert: stream peek
		equals: $b asInteger.
	self
		assert: stream next
		equals: $b asInteger