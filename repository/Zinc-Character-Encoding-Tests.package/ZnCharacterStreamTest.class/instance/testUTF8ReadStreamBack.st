tests
testUTF8ReadStreamBack
	| stream |
	stream := ZnCharacterReadStream on: 'élève' utf8Encoded readStream.
	self assert: (stream next: 3) equals: 'élè'.
	stream back.
	self assert: stream next equals: $è.
	self assert: stream peek equals: $v.
	stream back.
	self assert: stream next equals: $è.
	3 timesRepeat: [ stream back ].
	self assert: stream upToEnd equals: 'élève'