private
newConnectionTo: url
	self unixSocket
		ifNil: [ super newConnectionTo: url ]
		ifNotNil: [ :socketPath | self newConnectionToUnixSocketFile: socketPath asFileReference ]