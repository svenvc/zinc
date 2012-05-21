private-protocol
method: method for: url headers: headerCollection data: dataEntity limit: limit
	| stream redirects continue |
	redirects := 0.
	continue := true.
	self prepareRequest: url method: method headers: headerCollection data: dataEntity.
	[ [ continue ] whileTrue: [
			stream := self openConnection.
			request setConnectionClose.
			[ self sendRequest: stream ] ensure: [ stream close ].
			(self response isRedirect and: [ redirects < limit ])
				ifTrue: [ self prepareRedirect: headerCollection. redirects := redirects + 1 ]
				ifFalse: [ continue := false ] ] ]
		on: Error
		do: self errorHandler.
	^ self response