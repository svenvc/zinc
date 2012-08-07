private
exceptionSetForIfFail
	"Return an explicit exception set for which the ifFail block, if any, will be invoked.
	This could later be cached, instance or class side, if necessary."
	
	^ Error, NetworkError, ZnParseError, ZnHttpUnsuccessful, ZnUnexpectedContentType 
	