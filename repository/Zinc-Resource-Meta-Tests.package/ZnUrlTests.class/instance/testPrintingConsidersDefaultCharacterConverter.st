testing
testPrintingConsidersDefaultCharacterConverter
	ZnDefaultCharacterEncoder
		value: ZnNullEncoder new
		during: [
			| url |
			(url := ZnUrl new)
				scheme: #http;
				host: 'www.seaside.st';
				port: 8080;
				addPathSegment: 'exampleWithUTF-8Ã¤Ã¶Ã¼';
				addPathSegment: 'foo.html';
				queryAt: 'qWithUTF-8Ã¤Ã¶Ã¼' put: '100ithUTF-8Ã¤Ã¶Ã¼';
				fragment: 'markithUTF-8Ã¤Ã¶Ã¼'.
			self assert: url printString equals: 'http://www.seaside.st:8080/exampleWithUTF-8%C3%A4%C3%B6%C3%BC/foo.html?qWithUTF-8%C3%83%C2%A4%C3%83%C2%B6%C3%83%C2%BC=100ithUTF-8%C3%83%C2%A4%C3%83%C2%B6%C3%83%C2%BC#markithUTF-8%C3%A4%C3%B6%C3%BC' ]