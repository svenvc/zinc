paths
downloadPathTo: directoryOfFileName for: baseName
	| downloadPath |
	downloadPath := FileDirectory on: directoryOfFileName.
	^ downloadPath exists
		ifTrue: [ (downloadPath / baseName) pathName ]
		ifFalse: [ directoryOfFileName ]
	