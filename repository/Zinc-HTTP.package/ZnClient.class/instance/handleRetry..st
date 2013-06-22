private protocol
handleRetry: exception
	self noteRetrying: exception.
	self close.
	(Delay forSeconds: self retryDelay) wait.
