# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.


<http://zn.stfx.eu>


[![Build Status](https://travis-ci.org/svenvc/zinc.svg?branch=master)](https://travis-ci.org/svenvc/zinc)


## Documentation

The [Zinc HTTP Components](zinc-http-components-paper.md) paper.

The [Building and deploying your first web app with Pharo](build-and-deploy-1st-webapp/build-deploy-1st-webapp.md) tutorial.


*Sven Van Caekenberghe* 


[MIT Licensed](https://github.com/svenvc/zinc/blob/master/license.txt)

## Loading into GemStone

1. [Upgrade to GLASS 1.0-beta.9](http://code.google.com/p/glassdb/wiki/GemToolsUpdate#Update_GLASS)

2. Install Zinc:

    ```Smalltalk
    "GemStone 2.4"
    Metacello new
      baseline: 'Zinc';
      repository: 'github://glassdb/zinc:gemstone2.4/repository';
      load: 'Tests'.
      
    "GemStone 3.1"
    Metacello new
      baseline: 'Zinc';
      repository: 'github://glassdb/zinc:gemstone3.1/repository';
      load: 'Tests'.
    ```

*See the [Releases page](https://github.com/glassdb/zinc/releases/) for instructions for installing specific Zinc releases.*

## Travis Status

**GemStone2.4.x** [![Build Status](https://travis-ci.org/glassdb/zinc.png?branch=gemstone2.4)](https://travis-ci.org/glassdb/zinc)

**GemStone3.1.x** [![Build Status](https://travis-ci.org/glassdb/zinc.png?branch=gemstone3.1)](https://travis-ci.org/glassdb/zinc)
