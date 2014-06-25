as yet unclassified
openConnectionToHostNamed: hostName port: portNumber
	| socket |
	socket :=SocketStreamSocket connectToServerOnHost: hostName port: portNumber.
	^self on: socket