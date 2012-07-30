private
propFindQuery
	| writer |
	(writer := XMLWriter new) 
		enablePrettyPrinting; 
		xml.
	writer tag
		name: 'a:propfind';
		xmlnsAt: 'a' put: 'DAV:';
		with: [
			writer tag: 'a:prop' with: [
				writer tag: 'a:resourcetype' ] ].
	^ writer contents 