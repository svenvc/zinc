paths
downloadPathTo: directoryOrFileName for: baseName
	| downloadPath |
	downloadPath := self fileDirectoryClass on: directoryOrFileName.
	^ (downloadPath exists and: [ downloadPath directoryEntry isDirectory ])
		ifTrue: [
			baseName ifNil: [ 
				self error: 'Not enough information to construct a download path' ]. 
			(downloadPath / baseName) pathName ]
		ifFalse: [ 
			directoryOrFileName ]