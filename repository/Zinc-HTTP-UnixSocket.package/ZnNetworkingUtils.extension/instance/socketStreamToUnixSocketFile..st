*Zinc-HTTP-UnixSocket
socketStreamToUnixSocketFile: socketFile
	| ipcSocket |
	ipcSocket := self unixSocketOnFile: socketFile.
	^ ZnNetworkingUtils socketStreamOn: ipcSocket.