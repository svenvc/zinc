*Zinc-HTTP-UnixSocket
unixSocketOnFile: socketFile
	| socketAddress ipcSocket |
	socketFile exists ifFalse: [ 
		ZnMissingUnixSocket new file: socketFile; signal ].
	socketAddress := NetNameResolver addressForSocketPath: socketFile fullName.
	ipcSocket := Socket newIPC.
	ipcSocket ifNil: [ 
		ZnCannotCreateUnixSocket new file: socketFile; signal ].
	ipcSocket connectTo: socketAddress.
	ipcSocket isConnected ifFalse: [ 
		ZnCannotConnectUnixSocket new file: socketFile; signal ].
	^ ipcSocket