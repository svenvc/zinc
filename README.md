# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.


<http://zn.stfx.eu>


## Please read the [Zinc HTTP Components](https://github.com/svenvc/zinc/blob/master/zinc-http-components-paper.md) paper


*Sven Van Caekenberghe* 


[MIT Licensed](https://github.com/svenvc/zinc/blob/master/license.txt)

## Loading into GemStone

1. [Upgrade to GLASS 1.0-beta.9.3][1]
2. Install Zinc (will install [GLASS](https://github.com/glassdb/glass)):

  ```Smalltalk
  GsDeployer deploy: [
    Metacello new
      baseline: 'Zinc';
      repository: 'github://GsDevKit/zinc:gs_master/repository';
      load: 'Tests' ].
  ```

## Travis Status [![Build Status](https://travis-ci.org/GsDevKit/zinc.png?branch=gs_master)](https://travis-ci.org/gs_master/zinc)

[1]: https://github.com/GsDevKit/gsDevKitHome/blob/master/projects/glass/upgradeTo1.0-beta9.3.md#upgrade-to-glass-10-beta93
