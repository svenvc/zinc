private-protocol
prepareRequest: urlObject method: method headers: headerCollection data: dataEntity
	| url |
	url := urlObject asZnUrl.
	request := ZnRequest new
		requestLine: (ZnRequestLine method: method uri: url);
		headers: (self prepareHeaders: headerCollection for: url method: method);
		entity: (self prepareData: dataEntity);
		yourself