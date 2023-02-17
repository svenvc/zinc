tests
testNesting
	| delegate handled response |
	handled := false.

	delegate := ZnPrefixMappingDelegate new
		map: 'first' to: (ZnPrefixMappingDelegate new
			map: 'second' to: [ :req | handled := true ]).

	delegate handleRequest: (ZnRequest empty url: '/first/second' asZnUrl).
	self assert: handled.

	"In a nested scenario the outer prefix should not be found"
	response := delegate handleRequest: (ZnRequest empty url: '/first' asZnUrl).
	self assert: response status equals: 404