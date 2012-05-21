as yet unclassified
testWritingCharacter
	| response string |
	response := ZnResponse ok: (ZnEntity text: 'Okay').
	string := String streamContents: [ :stream | response writeOn: stream ].
	self assert: (string includesSubString: '200 OK').
	self assert: (string includesSubString: 'Okay')