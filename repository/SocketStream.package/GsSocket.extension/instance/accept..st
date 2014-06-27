*socketstream
accept: aTimeoutInSeconds

"Accept a client request for a connection on the receiver.  Returns the socket
 created for a new connection, or nil if there was some problem.
 The result is an instance of speciesForAccept.
 For example, the following code does not return until there is a connection:
   
 sock := GsSocket new.
 sock makeServer.
 newsock := sock accept.
 msg := newsock read: 512."

^ self listen: nil acceptingWith: (self speciesForAccept basicNew) for: aTimeoutInSeconds
