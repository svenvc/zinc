I am ZnWebSocketDelegate, a plugin to allow a ZnServer to accept incoming WebSocket requests.

When accepted, the request is upgraded and a new WebSocket is created and handed to the handler block.

Here is how to get 3 examples up and running:

	ZnServer startDefaultOn: 1701.
	ZnServer default logToTranscript.
	ZnWebSocketDelegate installExamplesInDefaultServer.
	ZnServer stopDefault.

Part of Zinc HTTP Components.