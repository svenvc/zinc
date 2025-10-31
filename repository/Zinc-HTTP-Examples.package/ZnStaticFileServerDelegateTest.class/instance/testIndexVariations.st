tests
testIndexVariations
	ZnServer withOSAssignedPortDo: [ :server | | staticFileServerDelegate |
		(staticFileServerDelegate := ZnStaticFileServerDelegate new)
			directory: 'web'.
		server delegate: staticFileServerDelegate.
		{ 
			server localUrl.
			'http://localhost:{1}' format: { server port }.
			'http://localhost:{1}/' format: { server port }.
			'http://localhost:{1}/index.html' format: { server port }.
			'http://localhost:{1}?foo' format: { server port }.
			'http://localhost:{1}/?foo' format: { server port }.
			'http://localhost:{1}/index.html?foo' format: { server port } } do: [ :url | 
				| indexHtml |
				indexHtml := ZnClient new beOneShot get: url.
				self assert: indexHtml equals: self indexHtml ] ]