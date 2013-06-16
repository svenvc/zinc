class initialization
registerCallbackHandlerAt: aKey
	"setup an oauth2 callback handler"

	WAAdmin register: ZnOAuth2CallbackHandler at: aKey