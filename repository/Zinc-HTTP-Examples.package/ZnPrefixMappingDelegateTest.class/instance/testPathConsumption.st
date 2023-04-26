tests
testPathConsumption
	| delegate innerPath uri |
	uri := '/first/second/third' asZnUrl.

	delegate := ZnPrefixMappingDelegate new
		map: 'first' to: [ :req | innerPath := req url pathSegments ].

	delegate handleRequest: (ZnRequest empty url: uri).

	self assert: innerPath size equals: 2.
	self assert: uri pathSegments size equals: 3