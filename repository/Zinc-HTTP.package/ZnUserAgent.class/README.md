I implement a client for making HTTP requests. I can maintain session state across multiple requests, automatically follow redirects and notify observers of my request and response activity. The contents of my request headers can be modified easily.

DEPRECATED: Please use ZnNeoClient

Much of my behavior can be controlled with an instance of ZnUserAgentSettings.

Some examples of my use:

client := ZnUserAgent new.
response := client get: 'pharo-project.org'.
args := (Dictionary new) at: 'foo' put: 'bar'; yourself.
response := client post: 'mytestdomain.com/form' data: args.