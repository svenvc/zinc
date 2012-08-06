initialize-release
openUrl: urlObject
	| accessor |
	(urlObject isNil or: [ urlObject isEmpty ]) 
		ifTrue: [ ^ self ].
	accessor := ZnWebWorkspaceAccessor new.
	url := urlObject asZnUrl inContextOf: accessor endpoint.
	self contents: (accessor get: url).
	self label: url asString.
	self changed: #contents