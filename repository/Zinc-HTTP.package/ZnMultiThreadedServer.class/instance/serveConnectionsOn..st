private
serveConnectionsOn: listeningSocket
	"We wait up to acceptWaitTimeout seconds for an incoming connection.
	If we get one we wrap it in a SocketStream and #executeRequestResponseLoopOn: on it"
		 
	| stream socket |
	socket := (listeningSocket waitForAcceptFor: self acceptWaitTimeout) ifNil: [
		^ self noteAcceptWaitTimedOut ].
	stream := self socketStreamOn: socket.
	[ [ [ self executeRequestResponseLoopOn: stream ]
		ensure: [ self log debug: 'Closing stream'. self closeSocketStream: stream ] ]
			ifCurtailed: [ self log debug: 'Destroying socket'. socket destroy ] ]
				forkAt: Processor lowIOPriority
				named: self workerProcessName 