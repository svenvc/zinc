operations
put: urlObject data: entity username: username password: password
	self deprecated: 'Please use ZnEasy' on: '3 Oct 2011' in: 'Zinc HTTP Components'.
	^ ZnEasy put: urlObject data: entity username: username password: password