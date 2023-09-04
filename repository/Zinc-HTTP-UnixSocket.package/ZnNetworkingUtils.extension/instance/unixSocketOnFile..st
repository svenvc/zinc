*Zinc-HTTP-UnixSocket
unixSocketOnFile: socketFile
	| addressSize socketAddress ipcSocket |
	socketFile exists ifFalse: [ 
		ZnMissingUnixSocket new file: socketFile; signal ].
	
	NetNameResolver initializeNetwork.
	NetNameResolver
		primGetAddressInfoHost: ''
		service: socketFile fullName
		flags: 0
		family: 1
		type: 0
		protocol: 0.
	addressSize := NetNameResolver primGetAddressInfoSize.
	socketAddress := SocketAddress new: addressSize withAll: 0.
	NetNameResolver primGetAddressInfoResult: socketAddress.
	
	ipcSocket := Socket newIPC.
	ipcSocket ifNil: [ 
		ZnCannotCreateUnixSocket new file: socketFile; signal  ].
	ipcSocket connectTo: socketAddress.
	ipcSocket isConnected ifFalse: [ 
		ZnCannotConnectUnixSocket new file: socketFile; signal  ].
	^ ipcSocket