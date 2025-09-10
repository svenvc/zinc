private - protocol
executeHandlingErrors
	^ [ self executeWithRetriesRemaining: self numberOfRetries ]
			on: Error
			do: self ifFailBlock