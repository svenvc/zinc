protocol
continuation
	"Return a block that defines what happens after a successful connection upgrade.
	We will receive a ready-to-use instanciated WebSocket.
	We pass on our log support and delegate processing to our handler."

	^ [ :webSocket |
			webSocket log: self log.
			self handler value: webSocket ]