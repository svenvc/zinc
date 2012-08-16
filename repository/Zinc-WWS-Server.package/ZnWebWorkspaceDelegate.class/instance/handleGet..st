private request handling
handleGet: request
	| key workspace format entity |
	key := request uri firstPathSegment.
	workspace := workspaces at: key ifAbsent: [ ^ ZnResponse notFound: request uri ].
	format := request uri queryAt: 'format' ifAbsent: [ nil ].
	entity := (format = 'html' or: [ (self isBrowserRequest: request) and: [ format ~= 'text' ] ])
		ifTrue: [ ZnEntity html: (self generatePageFor: workspace withKey: key) ]
		ifFalse: [ ZnEntity text: workspace ].
	^ ZnResponse ok: entity