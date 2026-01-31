private
generateStatusCodesOverview
	"Generate an HTML page with an overview of all known HTTP status codes"
	
	| statusCodes |
	statusCodes := ZnConstants httpStatusCodes.
	^ self brandedPage: 'HTTP Status Codes' do: [ :html |
		html tag: #ul do: [
			statusCodes keys sorted do: [ :each |
				html tag: #li do: [
					html 
						tag: #a 
						attributes: { #href . ('/status-code/{1}' format: { each }) } 
						with: ('{1} {2}' format: { each . statusCodes at: each }) ] ] ] ]