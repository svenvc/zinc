private
defaultErrorHandler
	^ [ :error | 
			self log debug: [ error description ]. 
			error defaultAction ]