private
closeSocketStream: socketStream
	super closeSocketStream: socketStream.
	self lock critical: [ 
		self connections 
			remove: socketStream 
			ifAbsent: [ self log debug: [ 'Could not remove ', socketStream printString, ' ignoring' ] ] ]