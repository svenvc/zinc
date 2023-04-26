public
map: uriPrefixString to: handler
	self prefixDictionary
		at: uriPrefixString
		put: handler