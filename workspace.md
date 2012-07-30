```Smalltalk
"Metacello scripts"
Metacello image
	configuration: 'MetacelloPreview';
	get.
Metacello image
	configuration: 'MetacelloPreview';
	load.
Metacello new
	baseline: 'ZincHTTPComponents';
	repository: 'filetree:///opt/git/gs/zinc/repository';
	get.
Metacello new
	baseline: 'ZincHTTPComponents';
	repository: 'filetree:///opt/git/gs/zinc/repository';
	load: 'Tests'.
```
