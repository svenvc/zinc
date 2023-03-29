initialize-release
close
	httpClient ifNotNil: [
		httpClient close.
		httpClient := nil ]