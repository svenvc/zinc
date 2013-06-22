*zinc-http
asZnUrl
	^ ZnUrl new
		scheme: self scheme;
		host: self authority;
		port: self port;
		segments: (self path collect: [ :each | each isEmpty ifTrue: [ #/ ] ifFalse: [ each ] ]);
		query: (self query isNil ifTrue: [ nil ] ifFalse: [ ZnResourceMetaUtils parseQueryFrom: self query readStream ]);
		fragment: self fragment;
		yourself