baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                configuration: 'XML Support'
                with: [ 
                    spec
                        versionString: #'stable';
                        repository: 'http://www.squeaksource.com/MetacelloRepository' ].
            spec
                package: 'Zinc-HTTP';
                package: 'Zinc-AWS' with: [ spec requires: #('Zinc-HTTP' 'XML Support') ];
                package: 'Zinc-REST' with: [ spec requires: 'Zinc-HTTP' ];
                package: 'Zinc-WebDAV' with: [ spec requires: 'Zinc-HTTP' ];
                package: 'Zinc-WWS-Server' with: [ spec requires: 'Zinc-HTTP' ];
                package: 'Zinc-WWS-Client' with: [ spec requires: 'Zinc-HTTP' ];
                package: 'Zinc-Tests' with: [ spec requires: 'Zinc-HTTP' ].
            spec
                group: 'default' with: #('Core');
                group: 'Core' with: #('Zinc-HTTP');
                group: 'Tests' with: #('Zinc-Tests');
                group: 'AWS' with: #('Zinc-AWS');
                group: 'WebDAV' with: #('Zinc-WebDAV');
                group: 'WWS' with: #('Zinc-WWS-Server' 'Zinc-WWS-Client');
                group: 'REST' with: #('Zinc-REST') ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec package: 'Zinc-Patch-HTTPSocket' with: [ spec requires: 'Zinc-HTTP' ].
            spec group: 'Patch-HTTPSocket' with: #('Zinc-Patch-HTTPSocket') ].
    spec
        for: #'pharo1.x'
        do: [ 
            spec
                package: 'Zinc-FileSystem-Legacy';
                package: 'Zinc-HTTP' with: [ spec requires: 'Zinc-FileSystem-Legacy' ] ].
    spec
        for: #'pharo2.x'
        do: [ 
            spec
                package: 'Zinc-FileSystem';
                package: 'Zinc-HTTP' with: [ spec requires: 'Zinc-FileSystem' ] ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                configuration: 'GsCore'
                with: [ 
                    spec
                        version: '0.247';
                        repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
                configuration: 'GsPharo'
                with: [ 
                    spec
                        version: '0.9.2';
                        repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].
            spec
                package: 'SocketStream' with: [ spec repository: 'http://seaside.gemstone.com/ss/PharoCompat' ];
                package: 'Zinc-FileSystem-Legacy' with: [ spec requires: #('GsCore') ];
                package: 'Zinc-HTTP'
                    with: [ 
                            spec
                                requires: #('Zinc-FileSystem-Legacy');
                                includes: #('SocketStream') ];
                package: 'Zinc-Tests' with: [ spec requires: #('GsPharo') ] ]