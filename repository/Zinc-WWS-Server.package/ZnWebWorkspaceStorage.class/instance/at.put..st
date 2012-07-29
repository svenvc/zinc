accessing
at: key put: string
	| subDirectory |
	self directory assureExistence.
	subDirectory := self directory / (key first: 2).
	subDirectory assureExistence.
	FileStream 
		fileNamed: (subDirectory / key) pathName  
		do: [ :stream | 
			stream lineEndConvention: #lf.
			string linesDo: [ :each | stream nextPutAll: each; cr ] ]
