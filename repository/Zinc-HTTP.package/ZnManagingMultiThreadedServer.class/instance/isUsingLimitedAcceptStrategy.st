testing
isUsingLimitedAcceptStrategy
	^ (ZnCurrentOptions at: #acceptStrategy) = #limited