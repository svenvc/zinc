# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.


<http://zn.stfx.eu>


## Please read the [Zinc HTTP Components](https://github.com/svenvc/zinc/blob/master/zinc-http-components-paper.md) paper


*Sven Van Caekenberghe* 


[MIT Licensed](https://github.com/svenvc/zinc/blob/master/license.txt)

## Loading into gemstone

1. [Upgrade to GLASS 1.0-beta.9](http://code.google.com/p/glassdb/wiki/GemToolsUpdate#Update_GLASS)
2. Install Metacello Preview:

    ```Smalltalk
    Metacello new
      configuration: 'MetacelloPreview';
      version: #stable;
      repository: 'github://dalehenrich/metacello-work:configuration';
      load.
    ```

3. Install Zinc for **GemStone2.4.x**:

    ```Smalltalk
    Metacello new
      baseline: 'Zinc';
	  repository: 'github://glassdb/zinc:gemstone2.4/repository';
	  load: 'Tests'.
    ```

