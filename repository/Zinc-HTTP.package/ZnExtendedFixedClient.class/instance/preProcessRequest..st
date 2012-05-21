private
preProcessRequest: request
	super preProcessRequest: request.  
	preProcessHook notNil ifTrue: [
		preProcessHook value: request ]  