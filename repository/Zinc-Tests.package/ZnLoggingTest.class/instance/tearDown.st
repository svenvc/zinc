running
tearDown

	"thisContext crTrace."
	
	ZnLogEvent announcer unsubscribe: self.
	logEventCollection removeAll.
	logEventCollection := nil.
	
	super tearDown