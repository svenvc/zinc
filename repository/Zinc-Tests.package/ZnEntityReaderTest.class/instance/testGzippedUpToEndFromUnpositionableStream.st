testing
testGzippedUpToEndFromUnpositionableStream
	| text compressed headers reader |
	text := String streamContents: [ :out |
		1 to: 50000 do: [ :each | out print: each; space ] ].
	compressed := ByteArray streamContents: [ :out |
		(GZipWriteStream on: out) nextPutAll: text asByteArray; close ].
	(headers := ZnHeaders new)
		at: 'Content-Type' put: 'text/plain';
		at: 'Content-Encoding' put: 'gzip'.
	(reader := ZnEntityReader new)
		headers: headers;
		stream: (ZnUnpositionableReadStream on: compressed readStream);
		allowReadingUpToEnd.
	self assert: reader readEntity contents equals: text