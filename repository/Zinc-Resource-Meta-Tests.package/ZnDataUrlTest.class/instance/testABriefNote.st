tests
testABriefNote
	| dataUrl |
	dataUrl := ZnDataUrl fromString: 'data:,A%20brief%20note'.
	self assert: dataUrl data equals: 'A brief note'.
	self deny: dataUrl isBase64Encoded.