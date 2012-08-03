```Smalltalk
MetacelloProjectRegistration registry.

MetacelloProjectRegistration 
	resetRegistry;
	primeRegistryFromImage.

Metacello new
	baseline: [:spec | true ];
	repository: 'filetree:///opt/git/gs/zinc/repository';
	get.
	
Metacello image
	baseline: #('ZincHTTPComponents');
	silently;
	get.
Metacello image
	baseline: #('ZincHTTPComponents');
	silently;
	load: 'Tests'.

System signalAlmostOutOfMemoryThreshold: 75.
```
