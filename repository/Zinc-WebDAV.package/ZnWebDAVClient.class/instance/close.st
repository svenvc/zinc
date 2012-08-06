initialize-release
close
	httpClient ifNotNil: [
		httpClient close ].
	username := password := nil