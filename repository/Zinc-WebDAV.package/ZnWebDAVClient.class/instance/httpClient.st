private
httpClient
	^ httpClient ifNil: [ 
		httpClient := ZnClient new http; yourself ]