initialize-release
initialize 
	super initialize.
	workspaces := ZnWebWorkspaceStorage on: 'wws/data' asFileReference