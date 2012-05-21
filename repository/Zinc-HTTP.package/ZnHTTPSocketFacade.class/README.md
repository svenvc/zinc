I am ZnHTTPSocketFacade.

On my class side I implement all necessary replacement methods of HTTPSocket.

The interface (signature and semantics) of this API is defined by HTTPSocket.

Overwriting these HTTPSocket methods with mine will effectively redirect all
HTTP client access in this Smalltalk image through Zinc HTTP Components.

Part of Zinc HTTP Components.