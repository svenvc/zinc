tests
testUTF8ReadStreamPositioning
	| bytes stream |
	bytes := 'élève' utf8Encoded.
	stream := ZnCharacterReadStream on: bytes readStream.
	self assert: stream position equals: 0.
	stream position: 0.
	self assert: stream next equals: $é.
	stream position: 1.
	self assert: stream next equals: $é.
	stream position: 2.
	self assert: stream next equals: $l.
	stream position: 3.
	self assert: stream next equals: $è.
	stream position: 4.
	self assert: stream next equals: $è.
	stream position: 5.
	self assert: stream next equals: $v.
	stream position: 6.
	self assert: stream next equals: $e