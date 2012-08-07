private
setServerSocketOptions: socket
	socket
		setOption: 'NODELAY' value: true;
		setOption: 'SNDBUF' value: self class socketBufferSize;
		setOption: 'RCVBUF' value: self class socketBufferSize