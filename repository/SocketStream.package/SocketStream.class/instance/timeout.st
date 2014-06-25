as yet unclassified
timeout
	"Lazily initialized unless it has been set explicitly."

	timeout ifNil: [timeout := SocketStreamSocket standardTimeout].
	^timeout