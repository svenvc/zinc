private
socketStreamOn: socket
	| stream |
	stream := ZdcSecureSocketStream on: socket.
	stream sslSession certificateName: self certificate.
	stream accept.
	self log debug: 'TLS/SSL accept succeeded.'.
	^ stream