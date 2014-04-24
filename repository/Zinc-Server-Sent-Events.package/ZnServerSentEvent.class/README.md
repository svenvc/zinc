A ZnServerSentEvent is used to send data from a server to an HTTP client, on the initiative of the server, often called a push notification.

ZnServerEvents are written out according to the text/event-stream MIME type.

Instances variables

 data <String> the actual data without LF, CR or CRLF
 event <String> optional event type tag
 id <String> optional event id tag
 retry <Integer> optional number of milliseconds for connection retry

References

 http://en.wikipedia.org/wiki/Server-sent_events
 http://dev.w3.org/html5/eventsource/
 https://developer.mozilla.org/en-US/docs/Server-sent_events/Using_server-sent_events

  ZnServerSentEvent type: 'counter' data: 100.

Part of Zinc HTTP Components