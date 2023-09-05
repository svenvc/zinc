# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.

[![CI](https://github.com/svenvc/zinc/actions/workflows/CI.yml/badge.svg)](https://github.com/svenvc/zinc/actions/workflows/CI.yml)
[![Pharo 7.0](https://img.shields.io/badge/Pharo-7.0-informational)](https://pharo.org)
[![Pharo 8.0](https://img.shields.io/badge/Pharo-8.0-informational)](https://pharo.org)
[![Pharo 9.0](https://img.shields.io/badge/Pharo-9.0-informational)](https://pharo.org)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-informational)](https://pharo.org)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-informational)](https://pharo.org)

Based on core classes modelling all main HTTP concepts, a full featured HTTP client and server are provided.


## API


Here are a couple of simple examples to give an impression of the API.
You start a default (easy to reference) HTTP server with just one line of code.

```Smalltalk
ZnServer startDefaultOn: 1701.
```

Now you can browse locally to http://localhost:1701 - in particular have a look at the /help section and /echo - these are part of a set of demonstration handlers.

Accessing the server that we just started from code is easy too.

```Smalltalk
ZnClient new 
  url: ZnServer default localUrl; 
  addPathSegment: #echo; 
  entity: (ZnEntity text: 'Hello'); 
  post.
```

This builds an HTTP POST to our server's /echo handler with a simple text as resource. The server will echo information about the request it received, including the text resource that you posted.

By default, the demonstration server has a couple of handlers, mostly for testing. You can add your own, to do additions (sum two numbers), for example.

```Smalltalk
ZnServer default delegate 
  map: #adder to: [ :request | | x y sum |
    x := (request uri queryAt: #x) asNumber.
    y := (request uri queryAt: #y) asNumber.
    sum := x + y.
    ZnResponse ok: (ZnEntity text: sum asString) ].
```

This creates a new handler /adder that will take 2 query arguments, converts them to numbers and returns the result of adding them together.

Using the full client, we can test our new functionality.

```Smalltalk
ZnClient new 
  url: ZnServer default localUrl; 
  addPathSegment: #adder;
  queryAt: #x put: 1;
  queryAt: #y put: 2;
  get.
```

This builds an appropriate request to our /adder and executes it.
By entering the proper URL directly, this becomes a one liner.

```Smalltalk
'http://localhost:1701/adder?x=1&y=2' asUrl retrieveContents.
```


## Documentation


Over the years, various documentation has been written about Zinc HTTP Components. 
Some of it is somewhat outdated. We list the most recent first.

The code base has decent class and method comments, as well as unit tests and examples.

The best starter documentation can be found in the 
[Pharo Enterprise](http://books.pharo.org/enterprise-pharo/) book.

In particular, in the following chapters:
- [Client](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-HTTP-Client/Zinc-HTTP-Client.html)
- [Server](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-HTTP-Server/Zinc-HTTP-Server.html)
- [WebApp](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/WebApp/WebApp.html)
- [TeaPot](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Teapot/Teapot.html)
- [Encoding](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-Encoding-Meta/Zinc-Encoding-Meta.html)
- [WebSockets](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/WebSockets/WebSockets.html)

A live website can be found at [http://zn.stfx.eu](http://zn.stfx.eu). You can run part of this website locally.

The original [Zinc HTTP Components](doc/zinc-http-components-paper.md) paper.

The [Building and deploying your first web app with Pharo](doc/build-and-deploy-1st-webapp/build-deploy-1st-webapp.md) tutorial.

There is a separate [GemStone README](README-gemstone.md).

## Loading

```Smalltalk
Metacello new
  repository: 'github://svenvc/zinc/repository';
  baseline: 'ZincHTTPComponents';
  load.
```


*Sven Van Caekenberghe* 

[MIT Licensed](https://github.com/svenvc/zinc/blob/master/license.txt)
