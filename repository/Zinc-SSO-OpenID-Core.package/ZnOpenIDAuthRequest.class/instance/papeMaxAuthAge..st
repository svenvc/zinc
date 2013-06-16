accessing pape
papeMaxAuthAge: anInteger
	"Sets the maximum acceptable time (in seconds) since the user last authenticated. 
	If the session is older, the user will be prompted to log in again. Setting the value
	to zero will force a password reprompt regardless of session age."

	self nsPape: self class nsPape.
	self propertyAt: 'openid.pape.max_auth_age' put: anInteger