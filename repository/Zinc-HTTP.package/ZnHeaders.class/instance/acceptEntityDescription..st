accessing
acceptEntityDescription: entity
	"Take over the content type and length from entity"
	
	entity 
		ifNotNil: [
			self
				at: 'Content-Type' put: entity contentType printString;
				at: 'Content-Length' put: entity contentLength printString ]
		ifNil: [
			self 
				clearContentType; 
				clearContentLength ]