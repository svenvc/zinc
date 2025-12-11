responses
up: request
	"Answer a text plain response confirming that we are up and running."

	| response |
	response := '{1} up {2} ({3}) [{4}]' format: { 
		self serverVersion . 
		self uptime . 
		self memoryStatistics . 
		self serverClock }.
	^ ZnResponse ok: (ZnEntity textCRLF: response)