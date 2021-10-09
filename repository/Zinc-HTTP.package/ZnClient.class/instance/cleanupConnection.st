private
cleanupConnection
	(self isOneShot 
		or: [ 
			(request notNil and: [ request wantsConnectionClose ])
				or: [ response notNil and: [ response wantsConnectionClose ] ] ])
		ifTrue: [
			self close ]