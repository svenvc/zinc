initialize-release
prefixFromString: string
	"Set the path prefix under which I should be handling request to string,
	interpreting each /-separated token as a path element"

	self prefix: (string findTokens: '/')