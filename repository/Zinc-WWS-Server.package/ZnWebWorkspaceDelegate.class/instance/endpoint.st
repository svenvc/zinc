accessing
endpoint
	^ endpoint ifNil: [ endpoint := 'http://ws.stfx.eu' asZnUrl ]