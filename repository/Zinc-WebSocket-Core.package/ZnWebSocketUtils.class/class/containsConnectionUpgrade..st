accessing
containsConnectionUpgrade: headers
	^ (((headers at: 'Connection' ifAbsent: [ ^ false ]) 
			findTokens: ',') 
				collect: [ :each | each trimBoth asLowercase ]) 
					includes: 'upgrade'