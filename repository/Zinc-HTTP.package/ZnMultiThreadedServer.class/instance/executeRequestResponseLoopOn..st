private
executeRequestResponseLoopOn: stream
	"Execute the HTTP request / response loop on stream in 3 steps
	#readRequest: #handleRequest: and #writeResponse:on:
	until the other end indicates it wants to stop or times out"
	
	| request response |
 	self log debug: 'Executing request/response loop'.
    [ (request := self readRequestSafely: stream) notNil
		ifTrue: [
			(response := self handleRequest: request) setKeepAliveFor: request.
	 		self writeResponseSafely: response on: stream ].
	request isNil or: [ request wantsConnectionClose ] ] whileFalse 