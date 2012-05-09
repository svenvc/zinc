# HTTP

*Sven Van Caekenberghe*

*May 2012*


HTTP is arguably the most important application level network protocol for what we consider to be the internet.
It is the protocol that allows web browsers and web servers to communicate.
It is also becoming the most popular protocol for implementing web services.

Naturally, Pharo Smalltalk has out of the box support for HTTP.


## An introduction to HTTP


HTTP, short for Hypertext Transfer Protocol, functions as a request-response protocol in the client-server computing model.
As an application level protocol it is layered on top of a reliable transport such as a TCP socket stream.
The most important standard specification document describing HTTP version 1.1 is [RFC 2616](http://tools.ietf.org/html/rfc2616).
As usual another good starting point is the [Wikipedia article on HTTP](http://en.wikipedia.org/wiki/Http).

        +------>> request >>------+
    [client]                   [server]
        +------<< response <<-----+

A client, often called user-agent, submits an HTTP request to a server which will respond with an HTTP response.
The initiative of the communication lies with the client.
Requests and responses are quite similar and are often called HTTP messages.

In HTTP parlance, you request a resource. A resource, sometimes called an entity, 
is the combination of a collection of bytes and a mime-type. 
A simple text resource will consist of bytes encoding the string in some encoding, for example UTF-8,
and the mime-type 'text/plain;charset=utf-8'.
An HTML resource will have a mime-type like 'text/html;charset=utf-8'.

To specify which resource you want, a URL (Uniform Resource Locator) is used.
Web addresses are the most common form of URL.
For example, <http://www.pharo-project.org/images/pharo.png>, is a URL that referes to a PNG image resource on a specific server.

The reliable transport connection between an HTTP client and server is used bidirectionally:
both to send the request as well as to receive the response.
It can be used for just one request/response cycle, as was the case for HTTP version 1.0,
or it can be reused for multiple request/response cycles, as is the default for HTTP version 1.1.


## Zinc HTTP Components


[Zinc HTTP Components](http://zn.stfx.eu) is an open source Smalltalk framework to deal with HTTP.
It models most concepts of HTTP and its related standards and offers both client and server functionality.
One of its key goals is to offer understandability (Smalltalk's design principle number one).
Anyone with a basic understanding of Smalltalk and the HTTP principles should be able to understand 
what is going on and learn, by looking at the implementation.
Zinc, or Zn, after its namespace prefix, is an integral part of Pharo Smalltalk since version 1.3.
It has been ported to other Smalltalk implementations such as Squeak and Gemstone.

The reference Zn implementation lives in several places:

- <http://www.squeaksource.com/ZincHTTPComponents>
- <http://mc.stfx.eu/ZincHTTPComponents>
- <https://www.github.com/svenvc/zinc>

Installation instructions can be found there.


## Doing a simple request


The key object to programmatically execute HTTP requests is called ZnClient.
You instanciate it, use its rich API to configure and execute an HTTP request and access the response.
ZnClient is a stateful object to be threated like a builder.
Let's get started with the simplest possible usage.

    ZnClient new get: 'http://zn.stfx.eu/zn/small.html'.

Select the above expression and inspect or print it. 
If all goes well, you'll get a String back containing a very small HTML document. 
The #get: method belongs to the convenience API.
Let's make it a bit more explicit what happened.

    ZnClient new
      url: 'http://zn.stfx.eu/zn/small.html';
      get;
      response.

Here we explicitely set the url using #url:, execute an HTTP GET using #get and ask for the response object using #response.  
The above returns a ZnResponse object. It consists of 3 elements:

1. a ZnStatusLine object
2. a ZnHeaders object
3. an optional ZnEntity object

The status line says HTTP/1.1 200 OK, which means the request was successfull.
This can be tested by sending #isSuccess to either the response object or the client itself.
The headers contain meta data related to the response, including:

- the content-type (a mime-type), accessed with #contentType
- the content-lenth (a byte count), accessed with #contentLength
- the date the response was generated
- the server that generated the response

The entity is the actual resource: the bytes that should be interpreted in the context of the content-type mime-type.
Zn will automatically convert non-binary mime-types into Strings using the correct encoding.
In our example, the entity will be an instance of ZnStringEntity, a concrete subclass of ZnEntity.

Like any Smalltalk object, you can inspect or explore the ZnResponse object.
You might be wondering how this response was actually tranferred over the network.
That is easy with Zn, as the key HTTP objects all implement #writeOn: for this purpose.

    | response |
    response := (ZnClient new)
      url: 'http://zn.stfx.eu/zn/small.html';
      get;
      response.
    response writeOn: Transcript.
    Transcript flush.

If you have the Transcript open, you should see something like the following:

    HTTP/1.1 200 OK
    Date: Tue, 08 May 2012 19:00:25 GMT
    Modification-Date: Thu, 10 Feb 2011 08:32:30 GMT
    Content-Length: 113
    Server: Zinc HTTP Components 1.0
    Vary: Accept-Encoding
    Content-Type: text/html;charset=utf-8
    
    <html>
    <head><title>Small</title></head>
    <body><h1>Small</h1><p>This is a small HTML document</p></body>
    </html>
  
The first CRLF terminated line is the status line.
Next are the headers, each on a line with a key and a value.
An empty line ends the headers.
Finally, the entity bytes follows, either up to the content length or up to the end of the stream.

You might wonder what the request looked like as it went over the line ?
You can find out using the same technique.

    | request |
    request := (ZnClient new)
      url: 'http://zn.stfx.eu/zn/small.html';
      get;
      request.
    request writeOn: Transcript.
    Transcript flush.

In an open Transcript you will now see:

    GET /zn/small.html HTTP/1.1
    Accept: */*
    User-Agent: Zinc HTTP Components 1.0
    Host: zn.stfx.eu    

A ZnRequest object constists of 3 elements:

1. a ZnRequestLine object
2. a ZnHeaders object
3. an optional ZnEntity object

The request line contains the HTTP method (sometimes called verb), URL and the HTTP protocol version.
Next come the request headers, similar to the response headers, meta data including:

- the host we want to talk to
- the kind of mime-types that we accept or prefer
- the user-agent that we are

If you look carefully at the Transcript you will see the empty line terminating the headers.
For most kinds of requests, like for a GET, there is no entity.

For debugging and for learning, it can be helpful to enable logging on the client.
Try the following.

    ZnClient new
      logToTranscript;
      get: 'http://zn.stfx.eu/zn/small.html'.

This will print out lots of information on the Transcript, 
except for the entity (resource) itself because that might be too large.

    2012-05-09 14:30:59 866904 I Wrote a ZnRequest(GET /zn/small.html)
    2012-05-09 14:30:59 866904 D Sent headers
    Accept: */*
    User-Agent: Zinc HTTP Components 1.0
    Host: zn.stfx.eu

    2012-05-09 14:30:59 866904 I Read a ZnResponse(200 OK text/html;charset=utf-8 113B)
    2012-05-09 14:30:59 866904 D Received headers
    Date: Wed, 09 May 2012 12:25:44 GMT
    Modification-Date: Thu, 10 Feb 2011 08:32:30 GMT
    Content-Length: 113
    Server: Zinc HTTP Components 1.0
    Vary: Accept-Encoding
    Content-Type: text/html;charset=utf-8

    2012-05-09 14:30:59 866904 T GET /zn/small.html 200 113B 171ms

In a later subsection about server logging, which uses the same mechanism,
you will learn how to interpret and customize logging.


## Building URL's

Zn uses ZnUrl objects to deal with URLs. ZnClient also contains API to build URLs.
Let us revisit our initial example, using explicit URL construction with the ZnClient API.

    ZnClient new
      http;
      host: 'zn.stfx.eu';
      addPath: 'zn';
      addPath: 'small.html';
      get.

Instead of giving a string argument to be parsed into a ZnUrl, 
we now provide the necessary elements to constuct the URL manually,
by sending messages to our ZnClient object.
With #http we set what is called the scheme.
Then we set the hostname. Since we don't specify a port, the default port for HTTP will be used, port 80.
Next we add path elements, extending the path one by one.
 
A URL can also contain query parameters. Let's do a Google search.

    ZnClient new
      http;
      host: 'www.google.com';
      addPath: 'search';
      queryAt: 'q' put: 'Pharo Smalltalk';
      get.

Query parameters have a name and a value. Certain special characters have to be encoded.
You can build the same URL with the ZnUrl object, in several ways.

    ZnUrl new
      scheme: #http;
      host: 'www.google.com';
      addPathSegment: 'search';
      queryAt: 'q' put: 'Pharo Smalltalk';
      yourself.

The printable representation of the URL is

    http://www.google.com/search?q=Pharo%20Smalltalk

This can easily be parsed again into a ZnUrl object

    'http://www.google.com/search?q=Pharo%20Smalltalk' asZnUrl
    'http://www.google.com/search?q=Pharo Smalltalk' asZnUrl

Note how the ZnUrl parser is forgiving with respect to the space, like most browser would do.
When producing an external representation, proper encoding will take place.
In a later subsection, we will have a more detailed look at the capabilities of ZnUrl as a standalone object.


## Todo

This is a list of subjects that should be in the paper:

- using basic authentication
- reusing a client for multiple request (reuse timeout)
- issues related to reusing a client 
- cookie handling
- client redirects
- client retries and retry delay
- client error handling
- general client option mechanism
- client session concept
- setting accept header and enforcing that
- enforcing http success
- http response codes
- entity hierarchy (string, bytearray, streaming)
- form url encoded and multipart form data entities
- settings arbitrary headers
- special non-predefined methods
- head 
- delete
- put/post difference (location, 201)
- setting a custom port
- using if modified since
- client content reader/writer
- client download to
- client upload entity from
- client policies, oneShot
- client ifFail block
- client timeouts
- client progress signalling
- client streaming
- zn easy (image) options
- proxy options

- running an http server
- delegate & handleRequest:
- authenticator & authenticateRequest:do:
- default server
- starting & stopping server
- managed servers (register/unregister)
- server port, server bindingAddress
- server logging
- single threaded, multi threaded, managed multi threaded variants
- last request, last response
- server reader customization
- seaside adaptor
- default delegate
- static file server delegate
- value delegate
- monticello server delegate
- dispatcher delegate

- zn url features
- zn mimetype features
- logging options
- resource protection limits
- constants and global settings
- zn character encoding support
