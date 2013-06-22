request handling
executeOneRequestResponseOn: stream
	"Execute one single HTTP request / response cycle on stream in 3 steps:
	#readRequest: #handleRequest: and #writeResponse:on:
	Indicate that we intend to close the connection afterwards"

	| request response |
	self log debug: 'Executing 1 request/response cycle'.
	ZnCurrentServer
		value: self
		during: [ 
			request := self readRequest: stream.
			response := self handleRequest: request.
			response setConnectionClose.
			self writeResponse: response on: stream ]