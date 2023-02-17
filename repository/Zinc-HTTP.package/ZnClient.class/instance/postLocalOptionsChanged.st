private
postLocalOptionsChanged
	"local options were just changed, if they apply (are not already dynamically overwritte),
	apply those options that impact objects that fall outside the local options scope"

	ZnCurrentOptions value
		ifNil: [
			"request already exists (seen #initialize), set the user-agent should it have been customized"
			request headers
				at: 'User-Agent'
				put: (self localOptions at: #userAgentString) ]