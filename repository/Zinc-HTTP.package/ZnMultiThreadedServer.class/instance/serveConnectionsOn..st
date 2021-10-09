request handling
serveConnectionsOn: listeningSocket
	"We wait up to acceptWaitTimeout seconds for an incoming connection.
	If we get one we wrap it in a SocketStream and #executeRequestResponseLoopOn: on it"

	| stream socket |
	socket := listeningSocket waitForAcceptFor: self acceptWaitTimeout.
	socket ifNil: [ ^ self noteAcceptWaitTimedOut ].
	stream := [ self withDynamicVariablesDo: [ self socketStreamOn: socket ] ]
						on: ZnTooManyConcurrentConnections do: [ ^ self ].
	[ [ [ self executeRequestResponseLoopOn: stream ]
		ensure: [ self logConnectionClosed: stream. self closeSocketStream: stream ] ]
			ifCurtailed: [ socket destroy ] ]
				forkAt: Processor lowIOPriority
				named: self workerProcessName