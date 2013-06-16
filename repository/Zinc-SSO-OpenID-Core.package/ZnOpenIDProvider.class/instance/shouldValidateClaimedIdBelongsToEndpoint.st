accessing
shouldValidateClaimedIdBelongsToEndpoint

	^ shouldValidateClaimedIdBelongsToEndpoint ifNil: [ shouldValidateClaimedIdBelongsToEndpoint := true ]