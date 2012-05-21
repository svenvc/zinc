private protocol
executeWithRetriesRemaining: retryCount
	^ [ self executeWithRedirectsRemaining: self maxNumberOfRedirects ]
		on: Exception
		do: [ :exception |
			retryCount > 0
				ifTrue: [
					self 
						handleRetry;
						executeWithRetriesRemaining: retryCount - 1 ]
				ifFalse: [
					exception pass ] ]