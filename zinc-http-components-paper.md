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

    ZnClient new
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


## ZnClient lifecycle


HTTP 1.1 defaults to keeping the client connection to a server open, and the server will do the same.
This is useful and faster if you to issue more than one request.
ZnClient implements this behavior by default.

    Array streamContents: [ :stream | | client |
      client := ZnClient new url: 'http://zn.stfx.eu'.
      (1 to: 10) collect: [ :each | | url |
        url := '/random/', each asString.
        stream nextPut: (client path: url; get) ].
      client close ].

The above example sets up a client to connect to a specific host.
Then it collects the results of 10 different requests, asking for random strings of a specific size.
All request will go over the same network connection.

Neither party is required to keep the connection open for a long time, as this consumes resources.
Both parties should be prepared to deal with connections closing, this is not an error.
ZnClient will try to reuse an existing connection and reconnect once if this reuse fails.
The option connectionReuseTimeout limits how old a connection can be for reuse to be attempted.

Note how we also close the client. A network connection is an external resource, like a file, 
that should be properly closed after use.
If you don't do that, they will get cleaned up eventually by the system, but it is more efficient to do it yourself.

In many situations, you only want to do one single request.
HTTP 1.1 has provisions for this situation.
The beOneShot option of ZnClient will do just that.

    ZnClient new
      beOneShot;
      get: 'http://zn.stfx.eu/numbers.txt'.

With the beOneShot option, the client notifies the server that it will do just one request 
and both parties will consequently close the connection automatically. An explicit close it thus not needed.


## Basic Authentication


There are various techniques to add authentication, a mechanism to control who accesses which resources, to HTTP.
This is orthogonal to HTTP itself.
The simplest and most common form of authentication is called 'Basic Authentication'.

    ZnClient new
      username: 'john@hacker.com' password: 'trustno1';
      get: 'http://www.example.com/secret.txt'.

That is all there is to it.
If you want to understand how this works, look at the implementation of 
ZnRequest>>#setBasicAuthenticationUsername:password:

Basic authentication over plain HTTP is insecure because it transfers your username/password combination 
obfuscated by encoding it using the Base64 encoding.
When used over HTTPS, basic authentication is secure though.

Note that when sending multiple requests while reusing the same client, 
authentication is reset for each request, 
to prevent the accidental transfer of sensitive data.

Beware that basic authentication is not the same as a web application where you have to log in using a form.
See the subsection about cookies and sessions for an example of how this works.


## Submitting HTML forms


In many web applications HTML forms are used.
Examples are forms to enter a search string, a form with a username and password to log in
or complicated registration forms.
The classic, most common way this is implemented is by sending the data entered in the fields
to the server when a submit button is clicked.
It is possible to implement the same behavior programmatically using ZnClient.

First you have to find out how the form is implemented by looking at the HTML code.
Here is an example.

    <form action="search-handler" method="POST" enctype="application/x-www-form-urlencoded">
      Search for: <input type="text" name="search-field"/>
      <input type="submit" value="Go!"/>
    </form>

This form shows one text input field, preceded by a 'Search for:' label and followed by
a submit button with 'Go!' as label. 
Assuming this appears on a page with URL http://www.search-engine.com/
we can implement the behavior of the browser when the user clicks the button,
submitting or sending the form data to the server.

    ZnClient new
      url: 'http://www.search-engine.com/search-handler';
      formAt: 'search-field' put: 'Pharo Smalltalk';
      post.

The URL is composed by combining the URL of the page that contains the form with the action specified.
The default form encoding is, as explicitely specified here, 'application/x-www-form-urlencoded'.
By using the #formAt:put: method to set the value of a field, 
an entity of type ZnApplicationFormUrlEncodedEntity will be created if needed,
and the field name/value association will be stored in it.
When finally #post is invoked, the HTTP request sent to the server will include
a properly encoded entity. 
As far as the server is concerned, it will seems as if a real user submitted the form.
Consequently, the response should be as when you submit the form using a browser.
Be careful to include all relevant fields, even the hidden ones.

There is a second type of form encoding called 'multipart/form-data'.
Instead of adding fields, you add ZnMimePart instances. 
Suppose the HTML form specified a different enctype.

    <form action="search-handler" method="POST" enctype="multipart/form-data">
      Search for: <input type="text" name="search-field"/>
      <input type="submit" value="Go!"/>
    </form>

The code to do the upload would then be as follows.

    ZnClient new
      url: 'http://www.search-engine.com/search-handler';
      addPart: (ZnMimePart fieldName: 'search-field' value: 'Pharo Smalltalk');
      post.

In this case, an entity of type ZnZnMultiPartFormDataEntity is created and used.
This type is often used in forms that upload files. Here is an example.

    <form action="upload-handler" method="POST" enctype="multipart/form-datad">
      Photo file: <input type="file" name="photo-file"/>
      <input type="submit" value="Upload!"/>
    </form>

This would be the way to do the upload programmatically.

    ZnClient new
      url: 'http://www.search-engine.com/upload-handler';
      addPart: (ZnMimePart fieldName: 'photo-file' fileNamed: '/Pictures/cat.jpg');
      post.

Sometimes, the form's submit method is GET instead of POST, 
just send #get instead of #post to the client.
Note that this technique of sending form data to a server is different than
what happens with raw POST or PUT requests using a REST API.
In a later subsection we will come back to this. 


## Cookies and sessions


HTTP is by design a stateless protocol: each request/response cycle is independent.
This principle is crucial to the scaleability of the internet.
However, in web applications like a shopping cart in an online store, state is needed.
During your interaction with the web application, the server needs to know that your 
request/responses are part of your session: you log in, you add items to your shopping cart 
and you finally check out and pay. 
It would be problematic if the server mixed the request/responses of different users.

The most commonly used technique to track state across different request/response
cycles is the use of so called cookies. 
Cookies are basically key/value pairs connected to a specific domain.
Using a special header, the server asks the client to remember or update the value of a cookie for a domain.
On subsequent requests to the same domain, the client will use a special header to present the cookie and 
its remembered value again to the server.

As we saw before, a ZnClient instance is essentially stateful.
It not only tries to reuse a network connection but it also maintains a session
using a ZnUserAgentSession object.
One of the main functions of this session object is to manage cookies,
just like your browser does.
ZnCookie objects are held in a ZnCookieJar inside the session object.

Cookie handling will happen automatically.
This is a hypothetical example of how this might work, 
assuming a site where you have to log in before you are able to access a specific file.

    ZnClient
      url: 'http://cloud-storage.com/login';
      formAt: 'username' put: 'john.doe@acme.com';
      formAt: 'password' put: 'trustno1';
      post;
      get: 'http://cloud-storage.com/my-file'.

After the #post, the server will presumably set a cookie to acknowledge a successful login.
When a specific file is next requested, the client presents the cookie to prove the login.
The server knows it can send back the file because it recognizes the cookie as valid.
By sending #session to the client object, you can access the remembered cookies.


## PUT and POST


## DELETE and other HTTP methods



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


## Headers


HTTP meta data, both for requests and for responses, is specified using headers.
These are key/value pairs, both strings.
A large number of predefined headers exists, see this 
[List of HTTP header fields](http://en.wikipedia.org/wiki/HTTP_header).
The exact semantics of each header, especially their value, can be very complicated.

Although headers are key/value pairs, they are more than a regular dictionary.
There can be more values for the same key and keys are often written using a canonical capitalization, like 'Content-Type'.

ZnClient allows you to easily specify custom headers for which there is not yet a predefined accessor, which is most of them.
At the framework level, ZnResponse and ZnRequest offer some more predefined accessors, 
as well as a way to set and query any custom header by accessing their headers sub object. 
The following are all equivalent:

    ZnClient new accept: 'text/*'.
    ZnClient new request setAccept: 'text/*'.
    ZnClient new request headers at: 'Accept' put: 'text/*'. 
    ZnClient new request headers at: 'ACCEPT' put: 'text/*'. 
    ZnClient new request headers at: 'accept' put: 'text/*'. 

Once a request is executed, you can query the response headers like this

    client response isConnectionClose.
    (client response headers at: 'Connection' ifAbsent: [ '' ]) sameAs: 'close'.

There is also the option to bulk transfer any keyedCollection holding a set of key/value pairs.


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


## Client options and policies


To handle its large set of options, ZnClient implements a uniform, generic option mechanism
using the key methods #optionAt:put: and #optionAt:ifAbsent: (this last one always defines an explicit default),
storing them lazily in a dictionary.
The method category 'options' includes all accessor to actual settings.

Options are generally named after their accessor. An exception is #beOneShot.
For example, the timeout option has a getter named #timeout and setter named #timeout:
whose implementation defines its default

    ^ self 
        optionAt: #timeout
        ifAbsent: [ ZnNetworkingUtils defaultSocketStreamTimeout ]

The set of all option defaults defines the default policy of ZnClient.
For certain scenarios, there are policy methods that set several options at once.
The most useful one is called systemPolicy. 
It currently does the following.

    self 
       enforceHttpSuccess: true;
       enforceAcceptContentType: true;
       numberOfRetries: 2

This kind of behavior is good practice when system level code does an HTTP call.


## Proxy settings


In some networks you do not visit internet web servers directly, but indirectly via a proxy.
Such a proxy controls and regulates traffic.
A proxy can improve performance by caching often used resources,
but only if there is a sufficient hit rate.

Zn client functionality will automatically use the proxy settings defined in your Pharo image.
The UI to set a proxy host, port, username or password can be found in the Settings browser
under the Network category.

Accessing localhost will bypass the proxy.
To find out more about Zn's usage of the proxy settings, 
start by browsing the 'proxy' method category of ZnNetworkingUtils.



## Running a simple HTTP server


Getting an independent HTTP server up and running inside your Smalltalk image is surprisingly easy.

    ZnServer startDefaultOn: 1701.

Don't just try this yet. 
To be able to see what is going on, it is better to try this with logging enabled.

    (ZnServer defaultOn: 1701)
      logToTranscript;
      start.

So we are starting an HTTP server listening on port 1701.
Using a port below 1024 requires special OS level priviledges, ports like 8080 might already be in use.
Now just visit <http://localhost:1701> with your browser to see the Zn welcome page.
Or you can try accessing the welcome page using Zn itself.

    ZnClient new get: 'http://localhost:1701'.

On the Transcript you should see output related to the server's activities.

    2012-05-10 13:09:10 879179 I Starting ZnManagingMultiThreadedServer HTTP port 1701
    2012-05-10 13:09:10 580596 D Initializing server socket
    2012-05-10 13:09:20 398924 D Executing request/response loop
    2012-05-10 13:09:20 398924 I Read a ZnRequest(GET /)
    2012-05-10 13:09:20 398924 T GET / 200 1195B 0ms
    2012-05-10 13:09:20 398924 I Wrote a ZnResponse(200 OK text/html;charset=utf-8 1195B)
    2012-05-10 13:09:20 398924 I Read a ZnRequest(GET /favicon.ico)
    2012-05-10 13:09:20 398924 T GET /favicon.ico 200 318B 0ms
    2012-05-10 13:09:20 398924 I Wrote a ZnResponse(200 OK image/vnd.microsoft.icon 318B)
    2012-05-10 13:09:50 398924 D ConnectionTimedOut: Data receive timed out. while reading request
    2012-05-10 13:09:50 398924 D Closing stream

You can see the server starting and initializing its server socket on which it listens for incoming connections.
When a connection comes in, it starts executing its request-response loop.
Then it gets a GET request for / (the home page), for which it answers a 200 OK response with 1195 bytes of HTML.
The browser also asks for a favicon.ico, which the server supplies.
The request-response loop is kept alive for some time and usually closes when the other end does.
Although it looks like an error, it actually is normal, expected behavior.

Zn manages a default server to easy interactive experimentation. 
The default server also survives image save and restart cycles.
All this makes it extra convenient to access the server object itself for further inspection or to stop the server.

    ZnServer default.
    ZnServer stopDefault.

The Transcript output will confirm what happens.

    2012-05-10 13:14:20 580596 D Wait for accept timed out
    2012-05-10 13:19:20 580596 D Wait for accept timed out
    2012-05-10 13:19:42 879179 D Releasing server socket
    2012-05-10 13:19:42 879179 I Stopped ZnManagingMultiThreadedServer HTTP port 1701

Due to its implementation, the server will print an 'Wait for accept timed out' debug notification every 5 minutes.
Again, although it looks like an error, it is by design and normal, expected behavior.


## The default server delegate


Out of the box, a ZnServer will have a certain functionality that is related to testing and debugging.
This behavior is implemented by the ZnDefaultServerDelegate object.
Assuming your server is running locally on port 1701, this is the list of URLs that are available.

- <http://localhost:1701/> the default for /, equivalent to /welcome
- <http://localhost:1701/welcome> standard Zn greeting page 
- <http://localhost:1701/favicon.ico> nice Zn favicon used by browsers
- <http://localhost:1701/help> a list of these URLs
- <http://localhost:1701/status> a textual page showing some server internals
- <http://localhost:1701/dw-bench> a dynamically generated page for benchnarking
- <http://localhost:1701/unicode> a UTF-8 encoded page listing the first 591 Unicode characters
- <http://localhost:1701/random> a random string of characters
- <http://localhost:1701/bytes> a collection of bytes 
- <http://localhost:1701/echo> a textual response echoing the request

The random handler normally returns 64 characters, you can specify your own size as well.
For example, /random/1024 will respond with a 1Kb random string.
The random pattern consists of hexadecimal digits and ends with a linefeed.
The standard, slower UTF-8 encoding is used instead of the faster LATIN-1 encoding.

The bytes handler has a similar size option. Its output is in the form of a repeating BCDA pattern.
When requesting equally sized byte patterns repeatably, some extra server side caching will improve performance.

The echo handler is used extensively by the unit tests. 
It not only list the request headers as received by the server,
but even the entity if there is one.
In case of a non-binary entity, the textual contents will be included.
This is really useful to debug PUT or POST requests.


## Logging


Log output consists of an arbitrary message preceded by a number of fixed fields.
Here is an example of a server log.

    2012-05-10 13:09:10 879179 I Starting ZnManagingMultiThreadedServer HTTP port 1701
    2012-05-10 13:09:10 580596 D Initializing server socket
    2012-05-10 13:09:20 398924 D Executing request/response loop
    2012-05-10 13:09:20 398924 I Read a ZnRequest(GET /)
    2012-05-10 13:09:20 398924 T GET / 200 1195B 0ms
    2012-05-10 13:09:20 398924 I Wrote a ZnResponse(200 OK text/html;charset=utf-8 1195B)

The first two fields are the date and time in a fixed sized format.
The next number is a fixed sized hash of the process ID.
Note how 3 different processes are involved: the one starting the server (probably the UI process),
the actual server listening process, and the client worker process spawned to handle the request.
Finally, the single capital letter indicates the category. 
Then the actual message is printed.
  
Both ZnClient and ZnServer implement logging using a similar mechanism based on the announcements framework.
ZnLogEvents are subclasses of Announcement sent by an HTTP server or client containing logging information.
A log event has a TimeStamp, a Process ID, a category and a message.
The following categories are used: #info (I), #debug (D) and #transaction (T).

To help in the implementation, a ZnLogSupport object is used.
A hierarchy of listeners under ZnLogListener can then be used to process log events.
Log listeners feature a filtering mechanism.
The following concrete listeners are provided.

- ZnTranscriptLogger
- ZnFileLogger
- ZnStandardOutputLogger
- ZnMemoryLogger

To log something, send #info: #debug: or #transaction: to the log support object of a client or server (accessible by #log).
The argument can be either a string or a block that will only be executed when logging is actually enabled.

    server log info: [ 'User ', self getUsername, ' logged in.' ].

The Zn logging mechanism using an internal lock to make it thread safe, but it does serialize logging by multiple processes.
It is important to make the time spent inside the log block short and non blocking.

You can customize a listener before adding it to a log support.
The following example asks the default server to log just transaction events to a file named 'zn.log', next to your image.

    | logger |
    logger := ZnFileLogger onFileNamed: (FileDirectory default / 'zn.log') pathName.
    logger filter: #transaction.   
    ZnServer default log addListener: logger.


## Todo


This is a list of subjects that should be in the paper:


### Client related

1. client redirects
1. entity hierarchy (string, bytearray, streaming)
1. special non-predefined methods
1. delete
1. put/post difference (location, 201)
1. setting a custom port
1. using if modified since
1. client content reader/writer
1. client download to
1. client upload entity from
1. client progress signalling
1. client streaming

### Server related

1. delegate & handleRequest:
1. authenticator & authenticateRequest:do:
1. managed servers (register/unregister)
1. server port, server bindingAddress
1. single threaded, multi threaded, managed multi threaded variants
1. last request, last response
1. server reader customization
1. seaside adaptor
1. default delegate
1. static file server delegate
1. value delegate
1. monticello server delegate
1. dispatcher delegate

### Framework related

1. zn url features
1. zn mimetype features
1. resource protection limits
1. constants and global settings
1. zn character encoding support
1. chunked transfer
1. gzip transfer
