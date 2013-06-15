private
generateSimpleXrdsForEndpoint: endpoint andLocalId: localId
	^ '<xrds:XRDS xmlns="xri://$xrd*($v*2.0)" xmlns:xrds="xri://$xrds"><XRD><Service priority="0"><Type>http://specs.openid.net/auth/2.0/signon</Type><URI>'
		, endpoint , '</URI><LocalID>' , localId , '</LocalID></Service></XRD></xrds:XRDS>'