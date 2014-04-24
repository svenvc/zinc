logging
logToStandardOutput
	"Setup logging to the OS level standard output stream"

	self log addListener: ZnStandardOutputLogger new  