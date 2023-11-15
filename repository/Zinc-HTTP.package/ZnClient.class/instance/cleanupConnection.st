private
cleanupConnection
	(self isOneShot
		or: [
			self streaming not
				and: [
					(request isNotNil and: [ request wantsConnectionClose ])
						or: [ response isNotNil and: [ response wantsConnectionClose ] ] ] ])
		ifTrue: [
			self close ]