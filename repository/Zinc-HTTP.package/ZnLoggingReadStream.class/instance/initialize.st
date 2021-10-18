initialize-release
initialize
	super initialize.
	logger := [ :string | Transcript crShow: string ].
	identifier := self class name asString.
	logLevel := 1