responses
echoRequestHtml: request
	"Echo the incoming request"

	| page entity |
	page := self generateEchoRequest: request.
	entity := ZnEntity html: page.
	^ ZnResponse ok: entity