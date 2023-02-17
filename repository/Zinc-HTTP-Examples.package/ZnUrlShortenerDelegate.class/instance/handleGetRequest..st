request handling
handleGetRequest: request
	^ request uri lastPathSegment
			ifNotNil: [ :key |
				self class database
					at: key
					ifPresent: [ :url | ZnResponse redirect: url ]
					ifAbsent: [ ZnResponse notFound: request uri ] ]
			ifNil: [
				(request uri queryAt: #url ifAbsent: [ nil ])
					ifNil: [ ZnResponse ok: (ZnEntity html: self welcomeHTML) ]
					ifNotNil: [ :url | | key shortUrl |
						key := self class shorten: url.
						shortUrl := request server url / key.
						ZnResponse ok: (ZnEntity text: shortUrl printString) ] ]