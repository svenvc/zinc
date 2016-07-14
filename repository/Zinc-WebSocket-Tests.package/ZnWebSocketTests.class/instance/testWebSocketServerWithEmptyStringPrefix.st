testing
testWebSocketServerWithEmptyStringPrefix

  | echoServer |
	
	echoServer := ZnWebSocket
  					startServerOn: 1701 
					prefix: ''
  					do: [ :webSocket | 
						[ 
      						webSocket runWith: [ :message |
        					webSocket sendMessage: message ] ]
      					on: ConnectionClosed 
      					do: [ ] ].

 	self assertWebSocketClientReceivesEchoedStringWithPrefix: ''.

	"should be in a proper tearDown"
	echoServer stop
