testing
assertWebSocketClientReceivesEchoedStringWithPrefix: aPrefixString
	
	| sentMessage clientWebSocket receivedMessage |
	sentMessage := 'Hey there'.

	self shouldnt: [ clientWebSocket := ZnWebSocket to: 'ws://localhost:1701', aPrefixString ] 
			raise: ZnWebSocketFailed.
	
	clientWebSocket sendMessage: sentMessage.
   receivedMessage := clientWebSocket readMessage.

	self assert: sentMessage equals: receivedMessage.
	
	"should be in a proper tearDown"
	clientWebSocket close. 
	