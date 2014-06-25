as yet unclassified
testUpToAllAfterCloseNonSignaling
	"Tests correct behavior of #upToAll"

	| resp |
	clientStream nextPutAll: 'A line of text'.
	clientStream close.
	serverStream shouldSignal: false.
	self shouldnt: [resp := serverStream upToAll: String crlf] raise: ConnectionClosed.
	self assert: resp = 'A line of text'.