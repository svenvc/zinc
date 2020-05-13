I am ZnUrlShortenerDelegate, a web app/service that implements URL Shortening.

When invoked with no arguments, I show a small web page with a form where you can enter a URL.
When you click the 'Shorten' button, a new URL is returned as text.

This short URL consists of just a key (a base 36 integer of 6 digits) in its path.
This key is stored in my database (class side) and linked to the original URL.

When invoked with the key of a shortened URL as path, 
I reply with a redirect that opens the original URL.

It is also possible to access me programmatically (see below, see unit tests).

Usage

 ZnServer startDefaultOn: 1701.
 ZnServer default delegate: ZnUrlShortenerDelegate new.

 ZnClient new url: ZnServer default url; queryAt: #url put: 'http://stfx.eu'; get.

 ZnServer stopDefault.

Thanks to Cédrick Béler for the first implementation of this example.

Part of Zinc HTTP Components