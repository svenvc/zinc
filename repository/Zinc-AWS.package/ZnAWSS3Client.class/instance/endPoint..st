initialize-release
endPoint: host
	"Initialize me to talk to the endpoint named host.
	Create a new HTTP client if needed, else reuse the existing one."
	
	httpClient ifNil: [ (httpClient := ZnClient new) http ]. 
	httpClient host: host