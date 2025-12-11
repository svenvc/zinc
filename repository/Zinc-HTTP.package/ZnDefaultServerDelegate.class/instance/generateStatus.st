private
generateStatus
	"Generate an HTML page with the state of the server"

	^ self brandedPage: 'ZnServer Status' do: [ :html |
		html tag: #p do: [ html << 'I am '; print: ZnCurrentServer value ].
		html tag: #ul do: [ 
			html tag: #li with: ('Version: {1}' format: { self serverVersion }).
			html tag: #li with: ('Uptime: {1}' format: { self uptime }).
			html tag: #li with: ('Memory: {1}' format: { self memoryStatistics }).
			html tag: #li with: ('Server clock: {1}' format: { self serverClock}) ].
		html tag: #h1 with: 'Processes'.
		self processesOn: html ]