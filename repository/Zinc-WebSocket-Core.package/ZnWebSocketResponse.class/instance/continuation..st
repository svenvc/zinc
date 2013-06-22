initialize-release
continuation: block
	"Set the block that represents the continuation 
	when the server call #useConnection: on me.
	The block will be evaluated with an instanciated WebSocket."
	
	continuation := block