private
releaseServerSocket
	"Release our server socket"
	
	serverSocket ifNil: [ ^ self ].
	self log debug: 'Releasing server socket'.
	(Delay forMilliseconds: 10) wait.
	serverSocket destroy.
	serverSocket := nil