parsing
parseAuthority: stream
	| hostString |
	(hostString := stream upTo: $:) isEmpty 
		ifFalse: [  
			self host: (ZnUtils decodePercent: hostString) ].
	stream atEnd 
		ifFalse: [ 
			self port: (Integer readFrom: stream ifFail: [ ZnPortNotANumber signal ]) ]