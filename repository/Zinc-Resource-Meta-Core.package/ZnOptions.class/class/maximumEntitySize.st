options
maximumEntitySize
	"The maximum entity size in bytes that can read from a stream before ZnEntityTooLarge is signalled.
	Entities are the resources transferred by the HTTP procotol. Malicious parties could hurt a client or
	server by sending artificially large payloads. Setting a maximum is a protection against this."

	<znOption>

	^ 16 * 1024 * 1024