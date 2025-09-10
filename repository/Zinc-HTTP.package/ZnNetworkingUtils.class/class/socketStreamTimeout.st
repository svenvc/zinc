constants
socketStreamTimeout
	"Return the timeout in seconds for network socket stream operations like connecting, reading and writing."

	^ ZnCurrentOptions at: #socketStreamTimeout 