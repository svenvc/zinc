class initialization
initialize
	ManagedServers := IdentitySet new.
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self