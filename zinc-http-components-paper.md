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


## HTTP Success ?


A simple view of HTTP is: you request a resource and get a response back containing the resource.
But even if the mechanics of HTTP did work, and even that is not guaranteed (see the next section),
the response could not be what you expected. 

HTTP defines a whole set of so called status codes to define various situations.
These codes turn up as part of the status line of a response.
The dictionary mapping numeric codes to their textual reason string is predefined.

    ZnConstants httpStatusCodes.

A good overview can be found in the Wikipedia article [List of HTTP status codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes).
The most common code, the one that indicates success is numeric code 200 with reason 'OK'.
Have a look at the testing protocol of ZnResponse for how to interpret some of them. 

So if you do an HTTP request and get something back, you cannot just assume that all is well.
You first have to make sure that the call itself (more specifically) the response was successful.
As mentioned before, you can do so by sending #isSuccess to the response or the client.

    | client |
    client := ZnClient new.
    client get: 'http://zn.stfx.eu/zn/numbers.txt'.
    client isSuccess
      ifTrue: [ client contents lines collect: [ :each | each asNumber ] ]
      ifFalse: [ self inform: 'Something went wrong' ]

To make it easier to write better HTTP client code, ZnClient offers some useful API.
You can ask the client to consider non-successful HTTP responses as errors with the #enforceHTTPSuccess option.
The client will then automatically throw a ZnHTTPUnsuccesful exception.
This is generally useful when upstream code handles errors.

To install a local failure handler, there is the #ifFail: option.
This will invoke a block, optionally passing an exception, whenever something goes wrong.
Together, this allows the above code to be rewritten as follows.

    | client |
    client := ZnClient new
      enforceHttpSuccess: true;
      ifFail: [ :exception | 
                  self inform: 'Cannot get numbers: ', exception printString ];
      get: 'http://zn.stfx.eu/zn/numbers.txt'.

Maybe it doesn't look like a big difference, but combined with some other options and features 
of ZnClient that we'll see later on, code does become more elegant and more reliable at the same time.


## Dealing with networking reality


As a network protocol, HTTP is much more complicated than an ordinary message send.
The famous [Fallacies of Distributed Computing](http://en.wikipedia.org/wiki/Fallacies_of_Distributed_Computing) 
eloquently list the issues involved:

- The network is reliable.
- Latency is zero.
- Bandwidth is infinite.
- The network is secure.
- Topology doesn't change.
- There is one administrator.
- Transport cost is zero.
- The network is homogeneous.

Zn will signal various exceptions when things go wrong, at different levels.
ZnClient and the underlying framework has constants, settings and options to deal 
with varioius aspects related to these issues.

Doing an HTTP request-response cycle can take an unpredictable amount of time.
Client code has to specify a timeout, the maximum amount of time we are prepared to wait for a response,
and be prepared for when that timeout is exceeded.
The fact you don't get an answer within a specified timeout can mean that some networking component is extremely slow,
but it could also mean that the server simply refuses to answer.

Setting the timeout directly on a ZnClient is the easiest.

    ZnClient new
      timeout: 1; 
      get: 'http://zn.stfx.eu/zn/small.html'. 

The timeout counts for each socket level connect, read and write operation, separately.
You can dynamically redefine the timeout using the ZnConnectionTimeout DynamicVariable.

    ZnConnectionTimeout 
      value: 5 
      during: [ ^ ZnClient new get: 'http://zn.stfx.eu/zn/small.html' ].

Zn defines its global default timeout in seconds as a setting.

    ZnNetworkingUtils defaultSocketStreamTimeout.
    ZnNetworkingUtils defaultSocketStreamTimeout: 60.

This setting affects most framework level operations, if nothing else is specified.

During the execution of HTTP various network exceptions, as subclasses of NetworkError, might be thrown.
These will all be caught by the #ifFail: block when installed.

To deal with temporary or intermittend network or server problems, ZnClient offers a retry protocol.
You can set how many times a request should be retried and how many seconds to wait between retries.

    ZnClient new
      numberOfRetries: 3;
      retryDelay: 2; 
      get: 'http://zn.stfx.eu/zn/small.html'. 

In the above example, the request will be tried up to 3 times, with a 2 second delay between attempts.
Note that the definition of failure/success is broad: it includes for example the option to enforce HTTP success.


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


## Content-types, mime-types and the accept header


Just because you ask for some resource which you thing is of a certain mime-type,
does not yet mean that is what you will get back.
The people maintaining the server might have reconfigured things.
The extension at the end of a URL has no real significance.
Asking for http://example.com/foo , http://example.com/foo.txt or http://example.com/foo.text
could all be the same or all be different.
That is why HTTP resources (entities) are accompanied by a content-type, 
a mime-type that is an official, cross-platform definition of a file or document type or format.
Again, see the Wikepedia article [Internet media type](http://en.wikipedia.org/wiki/Mime-type) for more details.

Zn models mime-types using its ZnMimeType object which has 3 components

- a main type, for example text or image
- a sub type, for example plain or html, or jpeg, png or gif
- a number of attributes, for example charset=utf-8

The class side of ZnMimeType has some convenience methods for accessing well known mime-types.
Note that for textual (non-binary) types, the encoding defaults to UTF-8, the prevalent internet standard.
Creating a ZnMimeType object is as easy as sending #asZnMimeType to a String.

    ZnMimeType textHtml.
    'text/html;charset=utf-8' asZnMimeType.

The subtype can be a wildcard, indicated by a '*'. This allows for matching.

    ZnMimeType textHtml matches: ZnMimeType text.

With ZnClient you can set the accept request header to indicate what you as a client expect
as well as enforce the fact that the server returns what you asked for.

    ZnClient new
      enforceAcceptContentType: true;
      accept: ZnMimeType textPlain;
      get: 'http://zn.stfx.eu/zn/numbers.txt'.

The above code will tell the server that we want a 'text/plain' type resouce by means of the 'Accept' header.
When the response comes back and it is not of that type, the client will raise a ZnUnexpectedContentType exception.
Again, this will be handled by the #ifFail: block, when specified.
This technique further improves your HTTP interaction.


## ZnEasy, typing even less, accessing images as forms


Although ZnClient is absolutely the preferred object to deal with all the intricacies of HTTP,
you sometimes wish you could to a quick HTTP request with an absolute minimum amount of typing,
especially during debugging. For these occasions there is ZnEasy, a class side API for quick HTTP requests.

    ZnEasy get: 'http://zn.stfx.eu/zn/numbers.txt'.

The result is always a ZnResponse object. Apart from basic authentication, there are no other options.
A nice feature here, more as an example, are some direct ways to ask for image resources as ready to use Forms.

    ZnEasy getGif: 'http://homepage.mac.com/svc/ADayAtTheBeach/calculator.gif'.
    ZnEasy getJpeg: 'http://caretaker.wolf359.be/sun-fire-x2100.jpg'.
    ZnEasy getPng: 'http://www.pharo-project.org/images/pharo.png'.

    (ZnEasy getPng: 'http://chart.googleapis.com/chart?cht=tx&chl=',
      'a^2+b^2=c^2' encodeForHTTP) asMorph openInHand.

When you explore the implementation, you will notice that ZnEasy uses a ZnClient object internally.


## Just the meta data, please


HTTP provides for a way to do a request, just like a regular GET but with a response that contains
only the meta data, the status line and headers, but not the actual resource or entity.
This is called a HEAD request.

    ZnClient new 
      head: 'http://zn.stfx.eu/zn/small.html';
      response.

Since there is no contents, we have to look at the response object.
Note that the content-type and content-length headers will be set,
as if there was an entity, although none is transferred. 


## Todo

This is a list of subjects that should be in the paper:

1. using basic authentication
1. reusing a client for multiple request (reuse timeout)
1. issues related to reusing a client 
1. cookie handling
1. client redirects
1. general client option mechanism
1. client session concept
1. entity hierarchy (string, bytearray, streaming)
1. form url encoded and multipart form data entities
1. settings arbitrary headers
1. special non-predefined methods
1. delete
1. put/post difference (location, 201)
1. setting a custom port
1. using if modified since
1. client content reader/writer
1. client download to
1. client upload entity from
1. client policies, oneShot
1. client progress signalling
1. client streaming
1. proxy options

1. running an http server
1. delegate & handleRequest:
1. authenticator & authenticateRequest:do:
1. default server
1. starting & stopping server
1. managed servers (register/unregister)
1. server port, server bindingAddress
1. server logging
1. single threaded, multi threaded, managed multi threaded variants
1. last request, last response
1. server reader customization
1. seaside adaptor
1. default delegate
1. static file server delegate
1. value delegate
1. monticello server delegate
1. dispatcher delegate

1. zn url features
1. zn mimetype features
1. logging options
1. resource protection limits
1. constants and global settings
1. zn character encoding support
1. chunked transfer
1. gzip transfer
