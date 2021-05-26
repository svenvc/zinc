I am BaselineOfZincHTTPComponents.
I am a BaselineOf.

I am used to load the Zinc HTTP Components project from GitHub as in 

  Metacello new
    repository: 'github://svenvc/zinc/repository';
    baseline: 'ZincHTTPComponents';
    load.

The following groups are available to load:

 - default (Core & Tests)
 - Core (Zinc-HTTP Zinc-HTTP-Examples Zinc-Zodiac-Core)
 - Tests (Zinc-Tests Zinc-Character-Encoding-Tests Zinc-Resource-Meta-Tests Zodiac-Tests Zinc-Zodiac-Tests)
 - Character-Encoding
 - Resource-Meta
 - Zodiac
 - AWS
 - WebDAV
 - WebSocket
 - SSO-OAuth1
 - SSO-OAuth2
 - SSO-OpenID
 - SSO-Demo
 - SSO (SSO-OAuth1 SSO-OAuth2 SSO-OpenID SSO-Demo Zinc-SSO-Demo)
 - WWS (Zinc-WWS-Server Zinc-WWS-Client)
 - REST
 - Server-Sent-Events

See also https://github.com/svenvc/zinc

Part of Zinc HTTP Components.
