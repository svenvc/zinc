private
generateSessionRequest: session
	"Generate an HTML page using a session"

	^ self brandedPage: 'Session' do: [ :html |
		html tag: #p do: [ html << 'I am using '; str: session asString ].
		html tag: #p do: [ html << 'Current session id is ' << session id ].
		html tag: #p do: [ html << 'Session hit count ' << (session attributeAt: #hitCount) asString ] ]