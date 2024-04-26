*Zinc-Tests
testFragmentWithQuestionMark

	| urlString url |
	urlString := 'http://www.example.com/#fragment?with?question?mark'.
	url := urlString asUrl.
	self assert: url segments isNil.
	self deny: url hasQuery.
	self assert: url asString equals: urlString