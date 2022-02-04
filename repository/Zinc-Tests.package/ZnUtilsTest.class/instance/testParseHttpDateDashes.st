testing
testParseHttpDateDashes
	"RFC 850, obsoleted by RFC 1036"

	| timeStamp |
	timeStamp := ZnUtils parseHttpDate: 'Tuesday, 13-Sep-11 08:04:49 GMT'.
	self assert: timeStamp dayOfMonth equals: 13.
	self assert: timeStamp monthIndex equals: 9.
	self assert: timeStamp year equals: 2011.
	self assert: timeStamp hour equals: 8.
	self assert: timeStamp minute equals: 4.
	self assert: timeStamp second equals: 49.
	self assert: timeStamp offset equals: Duration zero