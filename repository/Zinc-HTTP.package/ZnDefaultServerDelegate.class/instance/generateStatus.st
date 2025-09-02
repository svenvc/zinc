private
generateStatus
	"Generate an HTML page with the state of the server"

	^ self brandedPage: 'ZnServer Status' do: [ :html |
		html tag: #p do: [ html << 'I am '; print: ZnCurrentServer value ].
		html tag: #ul do: [ 
			html tag: #li with: self serverVersion.
			html tag: #li with: self uptime.
			html tag: #li with: self memoryStatistics.
			html tag: #li with: self serverClock ].
		html tag: #h1 with: 'Processes'.
		self processesOn: html ]