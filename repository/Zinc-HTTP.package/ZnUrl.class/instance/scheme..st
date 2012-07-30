accessing
scheme: symbol
	symbol isNil 
		ifTrue: [ scheme := nil ]
		ifFalse: [ 
			(#(http https ws wws) includes: symbol asSymbol) 
				ifTrue: [ scheme := symbol asSymbol ]
				ifFalse: [ (ZnUnknownScheme scheme: symbol) signal ] ]
