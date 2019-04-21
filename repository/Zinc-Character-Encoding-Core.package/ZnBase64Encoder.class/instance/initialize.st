initialization
initialize
	super initialize.
	alphabet := DefaultAlphabet.
	inverse := DefaultInverse.
	self padding: $=.
	self whitespace: #any.
	self beStrict