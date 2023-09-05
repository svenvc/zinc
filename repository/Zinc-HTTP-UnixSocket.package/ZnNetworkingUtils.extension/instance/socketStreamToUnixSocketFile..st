*Zinc-HTTP-UnixSocket
socketStreamToUnixSocketFile: socketFile
	| ipcSocket |
	ipcSocket := self unixSocketOnFile: socketFile.
	^ self socketStreamOn: ipcSocket