I am ZnWebDAVClient, a simple client to talk to a WebDAV server.

Currently only a very small amount of a normal WebDAV client's functionality is implemented.

ZnWebDAVClient new
	host: 'localhost';
	port: 8000;
	username: 'johndoe' password: 'secret';
	list;
	at: 'foo.txt' put: (ZnEntity text: 'Pharo Smalltalk');
	at: 'foo.txt'.

I depend on Zinc HTTP Components and XML Support.