# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.


<http://zn.stfx.eu>


## Please read the [Zinc HTTP Components](https://github.com/svenvc/zinc/blob/master/zinc-http-components-paper.md) paper


*Sven Van Caekenberghe* 


[MIT Licensed](https://github.com/svenvc/zinc/blob/master/license.txt)

## Loading into GemStone

1. Upgrade to GLASS 1.0-beta.9.3
   
  ```Smalltalk
  GsDeployer deploy: [
    | glassVersion |
    glassVersion := ConfigurationOfGLASS project currentVersion.
    glassVersion versionNumber < '1.0-beta.9.3' asMetacelloVersionNumber
      ifTrue: [
        Transcript
          cr;
          show: '-----Upgrading GLASS to 1.0-beta.9.3'.
        GsDeployer deploy: [
          Gofer new
            package: 'ConfigurationOfGLASS';
            url: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository';
            load.
          (((System stoneVersionAt: 'gsVersion') beginsWith: '2.') and: [glassVersion versionNumber < '1.0-beta.9.2' asMetacelloVersionNumber])
            ifTrue: [
              ((Smalltalk at: #ConfigurationOfGLASS) project version: '1.0-beta.9.2') load ].
          ((Smalltalk at: #ConfigurationOfGLASS) project version: '1.0-beta.9.3') load.
        ] ]
      ifFalse: [
        Transcript
          cr;
          show: '-----GLASS already upgraded to 1.0-beta.9.3' ] ].
  ```
2. Install Zinc (will install [GLASS](https://github.com/glassdb/glass)):

  ```Smalltalk
  GsDeployer deploy: [
    Metacello new
      baseline: 'Zinc';
      repository: 'github://GsDevKit/zinc:gs_master/repository';
      load: 'Tests' ].
  ```

## Travis Status [![Build Status](https://travis-ci.org/GsDevKit/zinc.png?branch=gs_master)](https://travis-ci.org/gs_master/zinc)
