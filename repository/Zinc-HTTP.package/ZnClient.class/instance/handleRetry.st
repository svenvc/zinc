private protocol
handleRetry
	self noteRetrying.
	self close.
	(Delay forSeconds: self retryDelay) wait.
