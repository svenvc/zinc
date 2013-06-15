private
repositoryListing
	^ String streamContents: [ :str |
		str nextPutAll: '<html><head><title>Monticello Repository</title></head>'.
		str nextPutAll: '<body><h1>Monticello Repository</h1>'.
		str nextPutAll: '<ul>'.
		self mczEntries do: [ :each | 
			str nextPutAll: '<li><a href="'; nextPutAll: each; nextPutAll: '">'; nextPutAll: each; nextPutAll: '</a></li>' ].
		str nextPutAll: '</ul></body></html>' ]