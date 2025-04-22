options
serverString
	"The string a server uses in the Server header of responses to identify itself.
	To provide malicious parties as little information as possible it could make sense to overwrite this.
	Also, to idenitify yourself as a specific server, you could use its server string."

	<znOption>

	^ ZnConstants defaultServerString