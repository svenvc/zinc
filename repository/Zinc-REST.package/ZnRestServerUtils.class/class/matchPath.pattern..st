utils
matchPath: path pattern: pattern
	"self matchPath: #('foo' '1' 'bar' '2') pattern: #('foo' '*' 'bar' '*')"
	
	| result |
	path isNil ifTrue: [ ^ pattern isNil ifTrue: [ #() ] ifFalse: [ nil ] ].
	(pattern isNil or: [ path size ~= pattern size ]) ifTrue: [ ^ nil ].
	(pattern includes: '*') 
		ifTrue: [ result := OrderedCollection new ]
		ifFalse: [ result := true ].
	pattern with: path do: [ :target :source |
		target = '*'
			ifTrue: [ 
				result add: source ]
			ifFalse: [ 
				source = target ifFalse: [ ^ nil ] ] ].
	^ result