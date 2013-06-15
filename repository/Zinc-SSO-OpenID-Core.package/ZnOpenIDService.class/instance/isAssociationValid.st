testing
isAssociationValid

	^associationResponse notNil and: [ associationExpireTime > self dateAndTimeNow ]