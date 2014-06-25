as yet unclassified
waitForDataIfClosed: closedBlock
	"Wait indefinitely for data to arrive.  This method will block until
	data is available or the socket is closed."

	[true]
		whileTrue: [
			self isConnected
				ifFalse: [^closedBlock value].
			(self readyForRead)
				ifTrue: [
					^self].

			self underlyingSocket readWillNotBlockWithin: -1].