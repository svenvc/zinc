accessing
at: key put: string
	| subDirectory |
	self directory ensureCreateDirectory.
	subDirectory := self directory / (key first: 2).
	subDirectory ensureCreateDirectory.
	(subDirectory / key) writeStreamDo: [ :out | 
		(ZnNewLineWriterStream on: out) in: [ :stream |
			stream forLf.
			string linesDo: [ :each | stream nextPutAll: each; newLine ] ] ]