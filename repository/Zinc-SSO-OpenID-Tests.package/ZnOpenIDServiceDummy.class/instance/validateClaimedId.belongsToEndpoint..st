actions
validateClaimedId: claimedId belongsToEndpoint: opEndpoint
	self shouldValidateEndpoint
		ifTrue: [ super validateClaimedId: claimedId belongsToEndpoint: opEndpoint ]