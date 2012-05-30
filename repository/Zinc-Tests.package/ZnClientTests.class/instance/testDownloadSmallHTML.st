testing
testDownloadSmallHTML
	| client |
	(ServerFileDirectory default fileExists: 'small.html')
		ifTrue: [ ServerFileDirectory default deleteFileNamed: 'small.html' ].
	"First download to a directory"
	(client := ZnClient new)
		url: 'http://zn.stfx.eu/zn/small.html';
		downloadTo: ServerFileDirectory default fullName.
	self assert: client isSuccess.
	self assert: client response contentType = ZnMimeType textHtml.
	FileStream 
		oldFileNamed: 'small.html' 
		do: [ :stream | self assert: (stream upToEnd includesSubString: 'Small') ].
	(ServerFileDirectory default fileExists: 'small.html')
		ifTrue: [ ServerFileDirectory default deleteFileNamed: 'small.html' ].
	"Second download to an explicitly named file"
	client 
		url: 'http://zn.stfx.eu/zn/small.html';
		downloadTo: 'small.html'.
	self assert: client isSuccess.
	self assert: client response contentType = ZnMimeType textHtml.
	FileStream 
		oldFileNamed: 'small.html' 
		do: [ :stream | self assert: (stream upToEnd includesSubString: 'Small') ].	
	client close.
	(ServerFileDirectory default fileExists: 'small.html')
		ifTrue: [ ServerFileDirectory default deleteFileNamed: 'small.html' ]	

