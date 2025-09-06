testing
testRandom
	self withServerDo: [ :server | | string newString |
		string := ZnClient new beOneShot; get: server localUrl / 'random/128'.
		self assert: string size equals: 128.
		self assert: string last equals: Character lf.
		newString := ZnClient new beOneShot; get: server localUrl / 'random/128'.
		self deny: newString equals: string ]