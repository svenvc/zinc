accessing
back
	self encoder backOnStream: stream.
	peeked ifNotNil: [
		self encoder backOnStream: stream.
		peeked := nil ].
	^ nil