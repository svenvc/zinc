streaming
signalProgress: amount total: total
	(ZnCurrentOptions at: #signalProgress)
		ifTrue: [
			total
				ifNil: [
					HTTPProgress new
						signal: ('Transferred {1} bytes ...' format: { amount humanReadableSIByteSize }) ]
				ifNotNil: [
					HTTPProgress new
						total: total;
						amount: amount;
						signal: 'Transferring...' ] ]