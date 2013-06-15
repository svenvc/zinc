accessing
limit
	^ limit ifNil: [ limit := self  defaultLimit ]