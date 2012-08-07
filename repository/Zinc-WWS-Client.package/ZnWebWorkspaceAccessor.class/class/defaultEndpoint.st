accessing
defaultEndpoint
	^ DefaultEndpoint ifNil: [ DefaultEndpoint := 'http://ws.stfx.eu' asZnUrl ]