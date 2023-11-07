printing
printContentsOn: stream
	super printContentsOn: stream.
	self bytes isNotNil ifTrue: [
		stream space; print: self bytes ]