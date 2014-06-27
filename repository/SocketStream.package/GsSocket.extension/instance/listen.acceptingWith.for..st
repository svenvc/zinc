*socketstream
listen: queueLength  acceptingWith: aSocket for: aTimeoutInSeconds

"Obsolete in GemStone 5.0."

"Listens for a connection, with the given queue limit.  Once a request
 for connection is received, acceptance is automatically performed, and
 the socket is attached to the given socket object, aSocket.  The socket
 object, aSocket, should be a closed socket, or uninitialized socket object.
   
 Does not return until there is a connection.
   
 Returns aSocket if a connection is made, or nil if an error occurs.
 If an error occurs, the error state of the receiver is updated."
  
| res |

res := true.
[res isKindOf: Boolean] whileTrue: [
  res := self _twoArgPrim: 4 with: aSocket with: queueLength.
  (res == false) ifTrue: [
    "would have blocked"
    res := self readWillNotBlockWithin: aTimeoutInSeconds.
  ].
].
(res == nil) ifFalse: [
  res := aSocket.
].
^res
