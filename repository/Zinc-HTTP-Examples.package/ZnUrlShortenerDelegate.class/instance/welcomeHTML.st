accessing
welcomeHTML
	^ ZnHtmlOutputStream streamContents: [ :html |
		html page: 'Zn URL Shortener' do: [
			html
				tag: #form
				attributes: #(action '/' 'accept-charset' 'utf-8' method GET)
				do: [
					html
						str: 'URL'; space;
						tag: #input attributes: #(type input name url value 'https://pharo.org' size 100); space;
						tag: #input attributes: #(type submit value 'Shorten') ] ] ]