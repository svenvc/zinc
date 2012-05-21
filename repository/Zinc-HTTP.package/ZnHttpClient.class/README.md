I implement an HTTP client with a high level API.

DEPRECATED: Please use ZnNeoClient

Some examples of my use:

response := ZnHttpClient new
	url: 'somedomain.com';
	auth: 'joe' password: 'secret';
	parameterAt: 'name' put: 'joe';
	headerAt: 'X-Custom Header' put: 'woot';
	get.
	 