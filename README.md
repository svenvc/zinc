# Zinc HTTP Components


Zinc HTTP Components is an open-source Smalltalk framework 
to deal with the HTTP networking protocol.


<http://zn.stfx.eu>


## Please read the [Zinc HTTP Components](https://github.com/svenvc/zinc/blob/master/zinc-http-components-paper.md) paper


*Sven Van Caekenberghe* 


[MIT Licensed](https://github.com/svenvc/zinc/blob/master/license.txt)

## Loading into gemstone

1. [Upgrade to GLASS 1.0-beta.8.7.2](http://code.google.com/p/glassdb/wiki/GemToolsUpdate#Update_GLASS)
1. [Install FileTree](https://github.com/dalehenrich/filetree/blob/master/doc/GemStoneInstall.md)
2. Install SocketStream:

    ```Smalltalk
    Gofer new
      gemsource: 'PharoCompat';
      package: 'SocketStream';
      load.
    ```

3. Clone Zinc repository:

    ```shell
    cd /opt/git/
    git clone -b gemstone2.4 https://github.com/glassdb/zinc.git
    ```

4. Install Zinc:

    ```Smalltalk
    repo := '/opt/git/zinc/repository'. "edit to match path to your cloned repository"
    Gofer new
        repository: (MCFileTreeRepository new directory: 
                        (ServerFileDirectory on: repo));
        package: 'Zinc-HTTP';
        package: 'Zinc-Tests';
        load.
    ```
