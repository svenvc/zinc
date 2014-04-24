A ZnServerSentEventResponse is a ZnResponse that will continue using the open HTTP connection by passing it to handler's #run: method.

This response is actual not Server-Sent Event specific and could be used in other scenarios as well (WebSockets, Comet).

Part of Zinc HTTP Components.
