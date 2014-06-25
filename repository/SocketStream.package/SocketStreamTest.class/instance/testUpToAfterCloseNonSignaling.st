as yet unclassified
testUpToAfterCloseNonSignaling
	"Tests correct behavior of #upToAll"

	| resp |
	clientStream nextPutAll: 'A line of text'.
	clientStream close.
	serverStream shouldSignal: false.
	self shouldnt: [resp := serverStream upTo: Character cr] raise: ConnectionClosed.
	self assert: resp = 'A line of text'.