testing
testHumanReadableSize
	self assert: (ZnUtils humanReadableSize: 999) equals: '999 B'.
	self assert: (ZnUtils humanReadableSize: 1500) equals: '1.50 kB'.
	self assert: (ZnUtils humanReadableSize: 1048576) equals: '1.05 MB'