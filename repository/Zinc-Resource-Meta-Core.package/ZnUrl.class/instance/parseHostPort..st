parsing
parseHostPort: stream
	| hostString |
	self isFile
		ifTrue: [ 
			(hostString := stream upTo: $/) isEmpty
				ifFalse: [ self host: (self decodePercent: hostString) ] ]
		ifFalse: [ 
			(hostString := stream upTo: $:) isEmpty
				ifFalse: [ self host: (self decodePercent: hostString) ].
			stream atEnd
				ifFalse: [ self port: (Integer readFrom: stream ifFail: [ ZnPortNotANumber signal ]) ] ]