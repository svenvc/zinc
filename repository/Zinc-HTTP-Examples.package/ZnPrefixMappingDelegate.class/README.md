I'm a ZnPrefixMappingDelegate. I provide mapping of handlers separated by URL prefix. A URI prefix is the first path segment in an URI. 

	apiHandler := MyRESTApiHandler new.
	testRunnerHandler := ZnTestRunnerDelegate new.

	prefixMappingDelegate := ZnPrefixMappingDelegate new
		map: 'api' to: apiHandler;
		map: 'tests' to: testRunnerHandler.

URI paths are consumed when the mapping happens so ZnPrefixMappingDelegate can be nested. 

	prefixMappingDelegate := ZnPrefixMappingDelegate new
		map: 'api' to: (ZnPrefixMappingDelegate new
			map: 'v2' to: apiHandler.
		map: 'tests' to: testRunnerHandler.
