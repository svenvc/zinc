private
withServerDo: block
  | server |
  server := super withServerDo: block.
  [ 
  server start.
  self assert: server isRunning & server isListening.
  block cull: server ]
    ensure: [ server stop ]