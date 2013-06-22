constants
clientHtml
	^ '<!DOCTYPE html>
<meta charset="utf-8" />
<title>WebSocket Chatroom</title>

<script language="javascript" type="text/javascript">

  var wsUri = "ws://" + location.host + "/ws-chatroom";
  var websocket;
  var output, handleInput, messageInput, sendButton, closeButton;

  function init() {
    output = document.getElementById("output");
    handleInput = document.getElementById("handleInput");
    messageInput = document.getElementById("messageInput");
    sendButton = document.getElementById("sendButton");
    closeButton = document.getElementById("closeButton");
    handleInput.value = "user-" + (new Date()).getMilliseconds();
    messageInput.onkeyup = function (evt) { if (evt.keyCode == 13) sendChatMessage(evt) }
    sendButton.onclick = function (evt) { sendChatMessage(evt) };
    closeButton.onclick = function (evt) { closeChat(evt) };
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
    doSend("Hi there !");
  }

  function onClose(evt) {
    writeToScreen("DISCONNECTED");
  }

  function onMessage(evt) {
    writeToScreen(evt.data);
   }

  function onError(evt) {
    writeToScreen("<span style=''color: red''>ERROR:</span> " + evt.data);
  }

  function doSend(message) {
     websocket.send(handleInput.value + ">>" + message);
  }

  function writeToScreen(message) {
    var pre = document.createElement("p");
    pre.style.wordWrap = "break-word";
    pre.innerHTML = message;
    output.appendChild(pre);
  }

  function sendChatMessage(evt) {
    doSend(messageInput.value);
    messageInput.value = "";
  }

  function closeChat(evt) {
    doSend("Bye!");
    websocket.close();
  }

  window.addEventListener("load", init, false);

</script>

<h2>WebSocket Chatroom</h2>
<div>
Handle: <input id="handleInput" type="text"/>
Message: <input id="messageInput" type="text" size="64"/> 
<input id="sendButton" type="submit" value="Send"/>
<input id="closeButton" type="submit" value="Close"/>
</div>
<div id="output"></div>

</html> '
