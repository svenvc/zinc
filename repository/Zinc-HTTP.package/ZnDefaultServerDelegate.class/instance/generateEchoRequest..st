private
generateEchoRequest: request
	"Generate a page echoing the incoming request"

	^ self brandedPage: 'Request' do: [ :html |
		html tag: #p with: 'This is Zinc HTTP Components echoing your request.'.
		html tag: #p with: ('Running {1}' format: { request server } ).
		html tag: #p with: ('{1} {2} {3}' format: { request method . request uri pathQueryFragmentPrintString . request requestLine version }).
		
		html tag: #h4 with: 'Headers'.
		html tag: #ul do: [
			request headersDo: [ :key :value |
				html tag: #li do: [
					html tag: #span attributes: #(style 'color:grey') do: [ html str: key; str: ':' ].
					html str: value ] ] ].

		request hasEntity ifTrue: [
			html tag: #h4 with: 'Body'.
			html tag: #p with: request entity printString ] ] 