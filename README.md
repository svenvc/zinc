# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.


<http://zn.stfx.eu>


## Please read the [Zinc HTTP Components](https://github.com/svenvc/zinc/blob/master/zinc-http-components-paper.md) paper


*Sven Van Caekenberghe* 


## Installation

```Smalltalk
run
ConfigurationOfGLASS project updateProject.
GsDeployer deploy: [ 

  "Upgrade to GLASS 1.0-beta.9.1"
  (ConfigurationOfGLASS project version: '1.0-beta.9.1') load].
%
commit

run
GsDeployer deploy: [ 

  "Load latest GLASS1 from github"
  Metacello new
    baseline: 'GLASS1';
    repository: 'github://glassdb/glass:master/repository';
    load.

  "Load Zinc"
  Metacello new
    baseline: 'Zinc';
    repository: 'github://glassdb/zinc:gemstone2.4/repository';
    load ].
%
commit
```

## Travis Status

**GemStone2.4.x** [![Build Status](https://travis-ci.org/glassdb/zinc.png?branch=gemstone2.4)](https://travis-ci.org/glassdb/zinc)
