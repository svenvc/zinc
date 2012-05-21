running
tearDown
	(FileDirectory default fileExists: 'small.html')
		ifTrue: [ FileDirectory default deleteFileNamed: 'small.html' ]
	