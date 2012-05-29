as yet unclassified
scheme: symbol
	symbol isNil 
		ifTrue: [ scheme := nil ]
		ifFalse: [ 
			(#(http https) includes: symbol asSymbol) 
				ifTrue: [ scheme := symbol asSymbol ]
					ifFalse: [ (ZnUnknownScheme scheme: symbol) signal ] ]