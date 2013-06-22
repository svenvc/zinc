removing
removeOldNonces
	"Removes old nonces from internal colletion if enough (#minumumRemovalInterval) time has been since
	last removal."
	(lastRemovalRun isNil or: [ lastRemovalRun - self dateAndTimeNow > self minimumRemovalInterval ])
		ifTrue: [ 
			lastRemovalRun := self dateAndTimeNow.
			nonces := nonces reject: [ :nonce | nonce isOld ] ]