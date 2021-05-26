I am ZnKeyValueStoreDelegate, I implement an example REST interface to a simple key-value store.

API

 GET /kvstore - list the full contents of the key-value store
 GET /kvstore/some-key - return the value stored under some-key, or NotFound
 PUT /kvstore/some-key - store the entity text as value for some-key
 DELETE /kvstore/some-key - delete the value stored under some-key, or NotFound

in all other cases, return a Bad Request.

Keys should be strings. Value enities should be text/plain. 

You can use your browser to see the full key-value store at http://localhost:1701/kvstore

See ZnKeyValueStoreClient for a concrete implementation of accessing me.
See my class side's #installInDefaultServer for one way to deploy me.
See ZnKeyValueStoreTest>>#setUp for an example of deploying me using a different port.

Here is a command line session using curl, interacting with me:

$ curl http://localhost:1701/kvstore
the key-value store is empty

$ curl -X PUT -d 'ABC' -H'Content-Type:text/plain' http://localhost:1701/kvstore/xyz
ABC

$ curl http://localhost:1701/kvstore/xyz
ABC

$ curl http://localhost:1701/kvstore
xyz = ABC

$ curl -X DELETE http://localhost:1701/kvstore/xyz
/kvstore/xyz

$ curl http://localhost:1701/kvstore/xyz
Not Found /kvstore/xyz

Note that some newlines were added for readabilty. 

Part of Zinc HTTP Components.