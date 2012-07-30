private
extendHeaderAt: key from: line
	"The value of a continuation header line is concatenated, 
	keeping the whitespace, but without the CRLF"
	
	self at: key put: (self at: key), line
	