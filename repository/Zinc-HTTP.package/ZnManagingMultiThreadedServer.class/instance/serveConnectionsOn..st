request handling
serveConnectionsOn: listeningSocket
	"We wait up to acceptWaitTimeout seconds for an incoming connection.
	If we get one we wrap it in a SocketStream and #executeRequestResponseLoopOn: on it.
	Overwritten to handle logic related to concurrent connections."

	| stream socket |
	socket := self acceptOn: listeningSocket.
	socket ifNil: [ ^ self noteAcceptWaitTimedOut ].
	stream := [ self socketStreamOn: socket ]
					on: ZnTooManyConcurrentConnections do: [ ^ self ].
	[ [ [ self executeRequestResponseLoopOn: stream ]
		ensure: [ self logConnectionClosed: stream. self closeSocketStream: stream ] ]
			ifCurtailed: [ socket destroy ] ]
				forkAt: Processor lowIOPriority
				named: self workerProcessName