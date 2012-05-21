operations
head: urlObject headers: headerCollection
	^ self method: #HEAD for: urlObject headers: headerCollection data: nil 