testing
isForceApprovalPrompt
	^ self approvalPrompt notNil and: [ self approvalPrompt = 'force' ]