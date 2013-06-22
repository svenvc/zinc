private
validateClaimedId: claimedId belongsToEndpoint: endpointUrl

	| response xrdsDocument elements |

	response := self httpClient 
		url: claimedId ;
		get ;
		response.
	response isSuccess
		ifFalse: [ ZnOpenIDClaimedIDVerificationError signal ].

	xrdsDocument := response contents.
	elements := ZnXRDService parseServicesFromXrds: xrdsDocument.
	elements := elements select: [ :service | service isClaimedIdService ].
	(elements anySatisfy: [ :e | e opEndpoint = endpointUrl ])
		ifFalse: [ ZnOpenIDClaimedIDVerificationError signal ].
