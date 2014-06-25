as yet unclassified
next: anInteger into: aCollection startingAt: startIndex
	"Read n objects into the given collection. 
	Return aCollection or a partial copy if less than
	n elements have been read."

	"Implementation note: This method DOES signal timeout if not 
	enough elements are received. It does NOT signal
	ConnectionClosed as closing the connection is the only way by
	which partial data can be read."

	| start amount |

	[self receiveData: anInteger] on: ConnectionClosed do:[:ex| ex return].

	"Inlined version of nextInBuffer: to avoid copying the contents"
	amount := anInteger min: (inNextToWrite - lastRead - 1).
	start := lastRead + 1.
	lastRead := lastRead + amount.
	aCollection 
		replaceFrom: startIndex 
		to: startIndex + amount-1 
		with: inBuffer 
		startingAt: start.
	^amount < anInteger 
		ifTrue:[aCollection copyFrom: 1 to:  startIndex + amount-1]
		ifFalse:[aCollection]