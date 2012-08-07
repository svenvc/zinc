ZnWebWorkspaceAccessor accesses workspace contents shared using the http://ws.stfx.eu web service.

Example usage:

	ZnWebWorkspaceAccessor new get: 'http://ws.stfx.eu/1WS4U'.

or

	ZnWebWorkspaceAccessor new get: '1WS4U'.

This global setting helps when testing:

	ZnWebWorkspaceAccessor defaultEndpoint: 'http://localhost:1701'.