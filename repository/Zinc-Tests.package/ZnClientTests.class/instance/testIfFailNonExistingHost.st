testing
testIfFailNonExistingHost
	| client |
	(client := ZnClient new)
		beOneShot;
		url: 'http://unknown-stfx.eu';
		ifFail: [ : exception | ^ self  ];
		get.
	self fail