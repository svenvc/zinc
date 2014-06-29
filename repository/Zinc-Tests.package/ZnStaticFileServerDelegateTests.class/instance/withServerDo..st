private
withServerDo: block
  | server staticFileServerDelegate |
  server := super withServerDo: block.
  [ 
  (staticFileServerDelegate := ZnStaticFileServerDelegate new)
    prefixFromString: 'local-files';
    directory: ZnFileSystemUtils defaultDirectory;
    mimeTypeExpirations: ZnStaticFileServerDelegate defaultMimeTypeExpirations.
  server delegate: staticFileServerDelegate.
  server start.
  self assert: server isRunning & server isListening.
  block cull: server ]
    ensure: [ server stop ]