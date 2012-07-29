paths
downloadPathTo: directoryOfFileName for: baseName
	| downloadPath |
	downloadPath := directoryOfFileName asFileReference.
	^ downloadPath exists
		ifTrue: [ (downloadPath / baseName) fullName ]
		ifFalse: [ directoryOfFileName ]
	