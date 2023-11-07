accessing
string: aString
	(string isNotNil and: [ aString ~= string ]) ifTrue: [ self invalidateContentLength ].
	string := aString