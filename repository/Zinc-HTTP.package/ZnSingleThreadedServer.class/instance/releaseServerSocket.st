private
releaseServerSocket
  "Release our server socket"

  serverSocket ifNil: [ ^ self ].
  self log debug: 'Releasing server socket'.
  serverSocket destroy.
  serverSocket := nil