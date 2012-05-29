*zinc-http
printYMDOn: aStream withLeadingSpace: printLeadingSpaceToo
	"Print just the year, month, and day on aStream.

	If printLeadingSpaceToo is true, then print as:
		' YYYY-MM-DD' (if the year is positive) or '-YYYY-MM-DD' (if the year is negative)
	otherwise print as:
		'YYYY-MM-DD' or '-YYYY-MM-DD' "

	| year month day |
	self dayMonthYearDo: [ :d :m :y | year := y. month := m. day := d ].
	year negative
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ printLeadingSpaceToo ifTrue: [ aStream space ]].
	aStream
		nextPutAll: (year abs asString padded: #left to: 4 with: $0);
		nextPut: $-;
		nextPutAll: (month asString padded: #left to: 2 with: $0);
		nextPut: $-;
		nextPutAll: (day asString padded: #left to: 2 with: $0)
