resources
httpClient

	^ httpClient ifNil: [ httpClient := ZnHttpClientDummy new ]