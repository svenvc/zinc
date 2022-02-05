testing
testNext
	| limitedReadStream |
	limitedReadStream := ZnLimitedReadStream on: String new readStream limit: 10.
	self assert: limitedReadStream atEnd.
	self assert: limitedReadStream next isNil.
	limitedReadStream := ZnLimitedReadStream on: 'ABC' readStream limit: 10.
	self assert: limitedReadStream atEnd not.
	self assert: limitedReadStream next equals: $A.
	self assert: limitedReadStream peek equals: $B.
	limitedReadStream next.
	self assert: limitedReadStream next equals: $C.
	self assert: limitedReadStream next isNil.
	self assert: limitedReadStream atEnd