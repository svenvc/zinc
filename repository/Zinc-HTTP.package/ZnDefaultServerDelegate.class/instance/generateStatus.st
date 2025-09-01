private
generateStatus
	"Generate an HTML page with the state of the server"

	^ self brandedPage: 'ZnServer Status' do: [ :html |
		html tag: #p do: [ html << 'I am '; print: ZnCurrentServer value ].
		html tag: #p with: ZnConstants defaultServerString.
		html tag: #p with: self uptime.
		html tag: #p with: self memoryStatistics.
		html tag: #h1 with: 'Processes'.
		self processesOn: html ]