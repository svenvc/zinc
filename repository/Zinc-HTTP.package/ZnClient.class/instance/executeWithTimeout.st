private protocol
executeWithTimeout
	^ self withTimeoutDo: [ 
		self ifFailBlock 
			ifNil: [
				self executeWithRetriesRemaining: self numberOfRetries ]
			ifNotNil: [
				[ self executeWithRetriesRemaining: self numberOfRetries ]
					on: self exceptionSetForIfFail 
					do: self ifFailBlock ] ]