public
startInServerOn: port
  "Start a new server bound to port on the local network running a test runner web service"

  "self startInServerOn: 1701"

  ^ (ZnServer on: port)
    bindingAddress: (GsSocket getHostAddressByName: 'localhost');
    delegate: self new;
    start;
    yourself