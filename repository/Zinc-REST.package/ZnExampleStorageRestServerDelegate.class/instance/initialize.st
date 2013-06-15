initialize-release
initialize 
	idCounter := 1000.
	self uriSpace: ZnCallHierarchyRestUriSpace new.
	self uriSpace rootClass: ZnExampleStorageRestCall