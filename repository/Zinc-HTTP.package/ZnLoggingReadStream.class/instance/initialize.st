initialization
initialize
	super initialize.
	logger := [ :string | string traceCr ].
	identifier := self class name asString.
	logLevel := 1