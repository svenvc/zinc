streaming
signalProgress: amount total: total
	(ZnCurrentOptions at: #signalProgress)
		ifTrue: [
			total
				ifNil: [
					HTTPProgress new
						signal: ('Transferred {1} bytes ...' format: { self humanReadableSize: amount }) ]
				ifNotNil: [
					HTTPProgress new
						total: total;
						amount: amount;
						signal: 'Transferring...' ] ]