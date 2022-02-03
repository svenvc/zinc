testing
testParseHttpDateAlternative1
	"ANSI C's asctime() format"

	| timeStamp |
	timeStamp := ZnUtils parseHttpDate: 'Tue Jan 01 00:00:01 2036'.
	self assert: timeStamp dayOfMonth equals: 1.
	self assert: timeStamp monthIndex equals: 1.
	self assert: timeStamp year equals: 2036.
	self assert: timeStamp hour equals: 0.
	self assert: timeStamp minute equals: 0.
	self assert: timeStamp second equals: 1.
	self assert: timeStamp offset equals: Duration zero