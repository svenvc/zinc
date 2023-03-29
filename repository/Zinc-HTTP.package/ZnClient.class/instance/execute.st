operations
execute
	"Execute the currently set up request to generate a response.
	Return the #contents of the response, if any."

	^ self withDynamicVariablesDo: [
		| result |
		self prepareRequest.
		result := self executeWithTimeout.
		self prepareNextRequest.
		result ]