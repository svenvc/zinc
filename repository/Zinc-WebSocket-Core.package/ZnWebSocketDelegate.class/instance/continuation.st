protocol
continuation
	"Return a block that defines what happens after a successful connection upgrade.
	We will receive a ready-to-use instanciated WebSocket.
	We delegate processing to our handler."

	^ [ :webSocket | self handler value: webSocket ]