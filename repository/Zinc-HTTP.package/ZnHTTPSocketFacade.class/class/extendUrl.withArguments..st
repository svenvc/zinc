private
extendUrl: urlObject withArguments: arguments
	| url |
	url := urlObject asZnUrl.
	(arguments isNil or: [ arguments isEmpty ]) ifTrue: [ ^ url ].
	^ arguments isString
		ifTrue: [ 
			(url printString, (arguments first = $? ifTrue: [ arguments ] ifFalse: [ '?', arguments ])) asZnUrl ] 
		ifFalse: [
			url == urlObject ifTrue: [ url := url copy ].   
			arguments keysAndValuesDo: [ :key :value | 
				value do: [ :each | url queryAt: key add: each ] ].
			^ url ]