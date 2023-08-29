I am ZnClient.
I am ZnUnixSocketClient, an object to build, execute, and process HTTP client request over Unix Domain Sockets.

Simplest possible invocation:

ZnUnixSocketClient new 
	unixSocket: '/var/run/docker.sock';
	get: 'http://localhost/v1.43/containers/json'.

It is equivalent to the following cURL command:

	curl --unix-socket /var/run/docker.sock http://localhost/v1.43/containers/json
	
Part of Zinc HTTP Components.