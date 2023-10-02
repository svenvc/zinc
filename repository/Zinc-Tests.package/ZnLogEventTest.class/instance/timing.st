accessing
timing
	^ ZnServerTransactionTiming new
			requestDuration: 1;
			responseDuration: 2;
			yourself