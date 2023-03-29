private
write16BitWord: word toStream: stream
	self isBigEndian
		ifTrue: [
			stream
				nextPut: (word byteAt: 2);
				nextPut: (word byteAt: 1) ]
		ifFalse: [
			stream
				nextPut: (word byteAt: 1);
				nextPut: (word byteAt: 2) ]