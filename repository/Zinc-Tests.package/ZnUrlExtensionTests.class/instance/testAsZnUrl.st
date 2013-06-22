testing
testAsZnUrl
	| url1 url2 url3 |
	url1 := 'http://www.example.com:8080/foo/bar/doc.txt?x=1&y=2#mark'.
	self assert: url1 asZnUrl = url1 asUrl asZnUrl.
	url2 := 'http://www.google.com'.
	self assert: url2 asZnUrl = url2 asUrl asZnUrl.
	url3 := 'http://www.google.com?q=Pharo'.
	self assert: url3 asZnUrl = url3 asUrl asZnUrl.
	"self assert: '' asZnUrl = '' asUrl asZnUrl."
	"self assert: '/' asZnUrl = '/' asUrl asZnUrl."

