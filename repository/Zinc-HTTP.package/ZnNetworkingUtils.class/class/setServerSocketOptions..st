as yet unclassified
setServerSocketOptions: socket
	socket
		setOption: 'NODELAY' value: true;
		setOption: 'SNDBUF' value: self socketBufferSize;
		setOption: 'RCVBUF' value: self socketBufferSize