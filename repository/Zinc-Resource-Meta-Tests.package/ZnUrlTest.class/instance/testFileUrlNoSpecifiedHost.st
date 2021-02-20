testing
testFileUrlNoSpecifiedHost
	| url |
	url := 'file:/users/Sven/Desktop/foo.txt' asZnUrl.
	self assert: url isFile.
	self assert: url host isNil.
	self assert: url pathSegments equals: #( 'users' 'Sven' 'Desktop' 'foo.txt' ) asOrderedCollection 