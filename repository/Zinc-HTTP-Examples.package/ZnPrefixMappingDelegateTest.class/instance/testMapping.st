tests
testMapping
	| delegate handled |
	handled := false.

	delegate := ZnPrefixMappingDelegate new
		map: 'first' to: [ :req | handled := true ].

	delegate handleRequest: (ZnRequest empty url: '/first' asZnUrl).

	self assert: handled