public
endpoint
	^ endpoint ifNil: [ endpoint := self class defaultEndpoint ]