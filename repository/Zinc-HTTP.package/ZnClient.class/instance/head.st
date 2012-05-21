operations
head
	"Execute a HTTP HEAD ont the request set up and return nil."

	^ self 
		method: #HEAD; 
		execute