initialize-release
initialize

	super initialize.
	
	self 
		ns: self class nsOpenId2;
		claimedId: self class selectId;
		identity: self class selectId