accessing
closeCode
	self assert: self isClose.
	self assert: self isEmpty not.
	^ (body readStream next: 2) asInteger
	