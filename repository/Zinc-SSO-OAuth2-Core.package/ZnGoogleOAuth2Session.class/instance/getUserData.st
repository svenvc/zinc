public
getUserData
	self
		deprecated: 'Rename to #getUserinfo to match the name of the Google REST resource'
		on: '2020/10/14'
		in: #Pharo7
		transformWith: '`@receiver getUserData' -> '`@receiver getUserinfo'.
	^ self getUserinfo
