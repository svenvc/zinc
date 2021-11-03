accessing
session
	"Return the current HTTP session object that I am using.
	This session object holds cookies and credentials."

	^ session ifNil: [ session := ZnUserAgentSession new ]