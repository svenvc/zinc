accessing
handler
	"Default to our demo"
	
	^ handler ifNil: [ handler := ZnServerSentEventStatusHandler new ]