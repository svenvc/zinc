accessing
at: key put: string
	| subDirectory |
	self directory ensureDirectory.
	subDirectory := self directory / (key first: 2).
	subDirectory ensureDirectory.
	(subDirectory / key) writeStreamDo: [ :stream | 
		stream lineEndConvention: #lf.
		string linesDo: [ :each | stream nextPutAll: each; cr ] ]
