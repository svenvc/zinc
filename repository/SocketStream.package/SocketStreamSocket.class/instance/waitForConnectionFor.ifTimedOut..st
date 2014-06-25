as yet unclassified
waitForConnectionFor: timeout ifTimedOut: timeoutBlock
	"Wait up until the given deadline for a connection to be established. Return true if it is established by the deadline, false if not."

"This doesn't work in Gemstone so we just accept"
	
^self accept

"|status|
status := self accept: timeout.

(status==false or:[status ==nil]) ifTrue:[^timeoutBlock value].
^status"