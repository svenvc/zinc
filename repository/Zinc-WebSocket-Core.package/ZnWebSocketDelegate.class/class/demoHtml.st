constants
demoHtml
	^ '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Zinc WebSocket Demo</title>
<style type="text/css">
body {
  color: black;
  background: white;
  width: 900px;
  font-family: Verdana, Arial, Helvetica, sans-serif;
  font-size: 13px;
}
p {
  width: 600px;
  padding: 0 20px 10px 20px;
} 
ul,ol {
  width: 600px;
  padding: 0 5px 5px 30px;
} 
#logo {
  color: orange;
  font-family: Helvetica, sans-serif;
  font-weight: bold;
  font-size: 100px;
}
li {
  margin-bottom: 1em;
}
</style>
</head>
<body>
<div id="logo">Zn</div>
<h1>Zinc WebSocket Demo</h1>
<ul>
  <li><a href="ws-echo-client">Echo</a> - websocket hello world: client connects, sends one message, server does an echo, client receives and shows message and disconnects</li>
  <li><a href="ws-echo-client-remote">Echo Remote</a> - websocket hello world against ws://echo.websocket.org (<a href="http://websocket.org">http://websocket.org</a>) for reference</li>
  <li><a href="ws-status-client">Status</a> - server side pushes continuous updates to client web page</li>
  <li><a href="ws-chatroom-client">Chatroom</a> - very simple chatroom: pick a handle and talk to all connected browsers</li>
</ul>
<h4>May the Source be with you!</h4>
</body></html>'