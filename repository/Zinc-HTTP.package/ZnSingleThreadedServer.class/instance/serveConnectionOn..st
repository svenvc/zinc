private
serveConnectionOn: listeningSocket
	"We wait up to acceptWaitTimeout seconds for an incoming connection.
	If we get one we wrap it in a SocketStream and #executeOneRequestResponseOn: on it"
		 
	| stream socket |
	socket := (listeningSocket waitForAcceptFor: self acceptWaitTimeout) ifNil: [
		^ self noteAcceptWaitTimedOut ].
	stream := self socketStreamOn: socket.
	[ [ [ self executeOneRequestResponseOn: stream ]
		ensure: [ self log debug: 'Closing stream'. stream close ] ]
			ifCurtailed: [ self log debug: 'Destroying socket'. socket destroy ] ]
				forkAt: Processor highIOPriority
				named: 'Zinc HTTP Server Worker'