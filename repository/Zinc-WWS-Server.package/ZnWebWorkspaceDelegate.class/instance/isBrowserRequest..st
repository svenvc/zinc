private
isBrowserRequest: request
	| accept primaryMimeType |
	accept := request headers at: 'Accept' ifAbsent: [ ^ false ].
	primaryMimeType := (((accept findTokens: ',') 
		collect: [ :each | each asZnMimeType])
			sorted: [ :x :y | | q1 q2 |
				q1 := (x parameterAt: 'q' ifAbsent: [ 1.0 ]) asNumber.
				q2 := (y parameterAt: 'q' ifAbsent: [ 1.0 ]) asNumber.
				q1 >= q2 ]) first.
	^ primaryMimeType = ZnMimeType textHtml