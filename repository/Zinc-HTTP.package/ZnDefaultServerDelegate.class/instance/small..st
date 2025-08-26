responses
small: request
	"Answer a small HTML page"

	| page |
	page := self brandedPage: 'Small' do: [ :html |
		html tag: #p with: 'This is a small HTML document' ].
	^ ZnResponse ok: (ZnEntity html: page)