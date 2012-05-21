operations
delete: urlObject headers: headerCollection
	^ self method: #DELETE for: urlObject headers: headerCollection data: nil 