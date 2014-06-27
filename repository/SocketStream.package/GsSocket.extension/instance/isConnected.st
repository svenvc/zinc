*socketstream
isConnected
"Returns true if the socket is connected to a peer.
 Returns false if the socket never was connected or has lost its connection
 to the peer and had no more data to read.
 Returns nil if an error occurs."

self isActive ifFalse: [ ^false ].
^ self _zeroArgPrim: 13.
