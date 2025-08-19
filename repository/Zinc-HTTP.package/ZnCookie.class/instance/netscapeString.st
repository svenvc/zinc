converting
netscapeString
	^ String streamContents: [ :stream |
		stream nextPutAll: self domain; tab.
		stream nextPutAll: 'TRUE'; tab.
		stream nextPutAll:  self path; tab.
		stream nextPutAll: self secure printString asUppercase; tab.
		stream print: ([ self expiresTimeStamp asUnixTime ] on: Error do: [ 0 ]); tab.
		stream nextPutAll: self name; tab.
		stream nextPutAll: self value ]