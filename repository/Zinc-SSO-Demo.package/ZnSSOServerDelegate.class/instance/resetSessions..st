accessing-session
resetSessions: request
	#(#google #microsoft #facebook #twitter) do: [ :each | 
			request session removeAttribute: each , '-session' ]