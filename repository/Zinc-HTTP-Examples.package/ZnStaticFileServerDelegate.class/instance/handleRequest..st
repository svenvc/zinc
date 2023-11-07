public
handleRequest: request
	"Server delegate entry point"

	| actualFilename |
	(#( #GET #HEAD ) includes: request method) ifFalse: [
		^ ZnResponse methodNotAllowed: request ].
	actualFilename := self actualFilenameFor: request uri.
	^ actualFilename
		  ifNotNil: [
			  (self
				   redirectNeededFor: request uri
				   actualFilename: actualFilename)
				  ifTrue: [ self directoryRedirectFor: request uri ]
				  ifFalse: [
				  self responseForFile: actualFilename fromRequest: request ] ]
		  ifNil: [ ZnResponse notFound: request uri ]