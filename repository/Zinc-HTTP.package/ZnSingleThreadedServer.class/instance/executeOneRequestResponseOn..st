private
executeOneRequestResponseOn: stream
	"Execute one single HTTP request / response cycle on stream in 3 steps:
	#readRequest: #handleRequest: and #writeResponse:on:
	Indicate that we intend to close the connection afterwards"

	| request response |
	self log debug: 'Executing 1 request/response cycle'.
	request := self readRequest: stream.
	(response := self handleRequest: request) setConnectionClose.
	self writeResponse: response on: stream