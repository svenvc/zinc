options
streaming: boolean
	"Set whether I will return streaming response objects (see ZnStreamingEntity) to boolean.
	If true, my users are responsible for actually reading the incoming response entity data stream."

	self optionAt: #streaming put: boolean