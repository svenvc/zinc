private
withServerDo: block
	ZnServer withOSAssignedPortDo: [ :server | | staticFileServerDelegate |
		(staticFileServerDelegate := ZnStaticFileServerDelegate new)
			prefixFromString: 'local-files';
			directory: ZnFileSystemUtils defaultDirectory;
			mimeTypeExpirations: ZnStaticFileServerDelegate defaultMimeTypeExpirations.
		server delegate: staticFileServerDelegate.
		block cull: server ]