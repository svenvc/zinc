copying
clone
	^ (self class new)
		parent: self;
		writable: true;
		yourself