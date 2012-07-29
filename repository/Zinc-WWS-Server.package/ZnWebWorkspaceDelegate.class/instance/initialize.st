initialize-release
initialize 
	super initialize.
	workspaces := ZnWebWorkspaceStorage on: (FileDirectory default / 'wws' / 'data')