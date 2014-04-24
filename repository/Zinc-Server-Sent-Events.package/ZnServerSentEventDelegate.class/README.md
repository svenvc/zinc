ZnServerSentEventDelegate is a ZnServer delegate that acts as a Server-Sent Events resource.

See ZnServerSentEvent's class comment for an introduction and some references.

I will check my prefix (if any), and initiate a Server-Sent Events response where a handler will #run: on the HTTP connection, using ZnServerSentEvent>>#writeOn: to push events to the client.

Without further configuration, I implement a simple example where a status string containing the time and memory usage are sent every 2 seconds.

My #clientHtml listens to simple status update event sent by the server, using ZnServerSentEventStatusHandler.

Installation

  ZnServerSentEventDelegate installInServer: ZnServer default.

Usage

  /sse-status-client - the HTML page with Javascript code
  /sse-status - the actual SSE resource

Part of Zinc HTTP Components.