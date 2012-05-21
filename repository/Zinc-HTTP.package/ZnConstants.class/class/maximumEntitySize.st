resource limits
maximumEntitySize
	"Return the maximum entity size to accept from a stream.
	Used by ZnEntity and subclasses. Can be set using #maximumEntitySize:
	Default value is 16Mb. This affects both client and server code.
	This helps to protect us from malicious content."
	
	^ MaximumEntitySize ifNil: [ MaximumEntitySize := 16 * 1024 * 1024 ] 