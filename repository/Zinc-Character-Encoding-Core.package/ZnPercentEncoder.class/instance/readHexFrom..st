private
readHexFrom: stream
	| first second |
	(stream atEnd not and: [(first := stream next digitValue) between: 0 and: 15])
		ifFalse: [ ZnCharacterEncodingError signal: 'hex digit expected' ].
	(stream atEnd not and: [ (second := stream next digitValue) between: 0 and: 15 ])
		ifFalse: [ ZnCharacterEncodingError signal: 'hex digit expected' ].
	^ (first << 4) + second