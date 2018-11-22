# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.

[![Build Status](https://travis-ci.org/svenvc/zinc.svg?branch=master)](https://travis-ci.org/svenvc/zinc)


Based on core classes modelling all main HTTP concepts, a full featured HTTP client and server are provided.


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

A live website can be found at [http://zn.stfx.eu](http://zn.stfx.eu). You can run part of this website locally.

The original [Zinc HTTP Components](zinc-http-components-paper.md) paper.

The [Building and deploying your first web app with Pharo](build-and-deploy-1st-webapp/build-deploy-1st-webapp.md) tutorial.


## Loading

```Smalltalk
Metacello new
  repository: 'github://svenvc/zinc/repository';
  baseline: 'ZincHTTPComponents';
  load.
```


*Sven Van Caekenberghe* 

[MIT Licensed](https://github.com/svenvc/zinc/blob/master/license.txt)
