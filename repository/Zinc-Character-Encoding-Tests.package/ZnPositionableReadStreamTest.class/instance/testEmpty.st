tests
testEmpty
	| stream |
	stream := ZnPositionableReadStream on: '' readStream.
	self assert: stream atEnd.
	self assert: stream peek isNil.
	self assert: stream next isNil.
	self assert: stream position isZero