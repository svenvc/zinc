private
generateEchoRequest: request
	"Generate a page echoing the incoming request"

	^ self brandedPage: 'Request' do: [ :html |
		html tag: #p with: 'This is Zinc HTTP Components echoing your request !'.
		html tag: #p with: ('Running {1}' format: { request server } ).
		html tag: #p with: ('{1} {2}' format: { request method . request uri pathQueryFragmentPrintString }).
		
		html tag: #h4 with: 'Headers'.
		html tag: #ul do: [
			request headersDo: [ :key :value |
				html tag: #li with: ('{1}: {2}' format: { key . value }) ] ].

		request hasEntity ifTrue: [
			html tag: #h4 with: 'Body'.
			html tag: #p with: request entity printString ] ] 