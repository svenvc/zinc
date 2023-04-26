private
writeCodePoint: codePoint to: stream
	self isBigEndian
		ifTrue: [
			stream
				nextPut: (codePoint byteAt: 4);
				nextPut: (codePoint byteAt: 3);
				nextPut: (codePoint byteAt: 2);
				nextPut: (codePoint byteAt: 1) ]
		ifFalse: [
			stream
				nextPut: (codePoint byteAt: 1);
				nextPut: (codePoint byteAt: 2);
				nextPut: (codePoint byteAt: 3);
				nextPut: (codePoint byteAt: 4) ]