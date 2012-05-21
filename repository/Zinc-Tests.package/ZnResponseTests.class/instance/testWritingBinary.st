as yet unclassified
testWritingBinary
	| response bytes string |
	response := ZnResponse ok: (ZnEntity text: 'Okay').
	bytes := ByteArray streamContents: [ :stream | response writeOn: stream ].
	string := bytes asString.
	self assert: (string includesSubString: '200 OK').
	self assert: (string includesSubString: 'Okay')