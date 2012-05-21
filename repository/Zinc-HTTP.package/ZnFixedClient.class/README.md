I am ZnFixedClient.
I implement the client part of the HTTP protocol. 

DEPRECATED: Please use ZnNeoClient

I talk to one fixed host:port combination, reusing the same connection for each request.
If I lose the connection, I simply reconnect. 
If something goes wrong, I do one retry.
I optionally use basic authentication.

(ZnFixedClient host: 'caretaker.wolf359.be')
	get: 'index.html';
	get: 'small.html'

Part of Zinc HTTP Components.