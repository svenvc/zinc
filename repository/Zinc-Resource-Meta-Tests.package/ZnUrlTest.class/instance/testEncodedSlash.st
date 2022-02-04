testing
testEncodedSlash
	self assert: 'http://example.com/foo//' asZnUrl pathPrintString equals: '/foo//'.
	self assert: 'http://example.com/foo//bar/' asZnUrl pathPrintString equals: '/foo//bar/'.
	self assert: 'http://example.com/foo//bar/file.txt' asZnUrl pathPrintString equals: '/foo//bar/file.txt'.

	self assert: 'http://example.com/foo/%2F' asZnUrl pathPrintString equals: '/foo/%2F'.
	self assert: 'http://example.com/foo/%2Fbar/' asZnUrl pathPrintString equals: '/foo/%2Fbar/'.
	self assert: 'http://example.com/foo/%2F/bar/' asZnUrl pathPrintString equals: '/foo/%2F/bar/'.
	self assert: 'http://example.com/foo/%2Ffoo.txt' asZnUrl pathPrintString equals: '/foo/%2Ffoo.txt'