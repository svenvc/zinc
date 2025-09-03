accessing
defaultTimeLimit
	^ ((self timeout + self retryDelay) * self numberOfRetries) seconds