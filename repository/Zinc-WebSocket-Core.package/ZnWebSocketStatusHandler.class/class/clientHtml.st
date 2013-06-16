constants
clientHtml
	^ '<!DOCTYPE html>
<meta charset="utf-8" />
<title>WebSocket Smalltalk Image Status Stream</title>

<script language="javascript" type="text/javascript">

  var wsUri = "ws://" + location.host + "/ws-status";
  var output, statusElement;

  function init() {
    output = document.getElementById("output");
    statusElement = document.getElementById("status");
    testWebSocket();
  }

  function testWebSocket() {
    writeToScreen(wsUri);
    websocket = new WebSocket(wsUri);
    websocket.onopen = function(evt) { onOpen(evt) };
    websocket.onclose = function(evt) { onClose(evt) };
    websocket.onmessage = function(evt) { onMessage(evt) };
    websocket.onerror = function(evt) { onError(evt) };
  }

  function onOpen(evt) {
    writeToScreen("CONNECTED");
    setStatus("Waiting for status data...");
   }

  function onClose(evt) {
    writeToScreen("DISCONNECTED");
  }

  function onMessage(evt) {
    setStatus(evt.data);
  }

  function onError(evt) {
    writeToScreen("<span style=''color: red''>ERROR:</span> " + evt.data);
  }

  function writeToScreen(message) {
    var pre = document.createElement("p");
    pre.style.wordWrap = "break-word";
    pre.innerHTML = message;
    output.appendChild(pre);
  }

  function setStatus(text) {
    statusElement.innerHTML = text;
  }

  window.addEventListener("load", init, false);

</script>

<h2>WebSocket Smalltalk Image Status Stream</h2>
<div><pre id="status"></pre></div>
<h3>Log</h3>
<div id="output"></div>

</html> '