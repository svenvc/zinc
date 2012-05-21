operations
get: urlObject headers: headerCollection
	^ self method: #GET for: urlObject headers: headerCollection data: nil 