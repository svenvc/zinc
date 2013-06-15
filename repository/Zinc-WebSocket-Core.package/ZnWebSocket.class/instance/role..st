initialize-release
role: symbol
	"Set the role of the receiver, either #client or #server"
	
	self assert: (#(client server) includes: symbol).
	role := symbol