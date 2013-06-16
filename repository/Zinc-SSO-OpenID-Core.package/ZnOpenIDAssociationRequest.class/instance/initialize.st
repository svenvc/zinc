initialize-release
initialize

	super initialize.
	self 
		ns: self class nsOpenId2;
		mode: self class modeAssociate