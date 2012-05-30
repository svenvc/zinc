running
tearDown
	(ServerFileDirectory default fileExists: 'small.html')
		ifTrue: [ ServerFileDirectory default deleteFileNamed: 'small.html' ]
