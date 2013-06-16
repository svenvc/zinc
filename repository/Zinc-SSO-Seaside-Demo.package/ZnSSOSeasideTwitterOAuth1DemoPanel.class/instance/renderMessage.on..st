rendering
renderMessage: msgDict on: html

	html text: (msgDict at: 'text' ifAbsent: [ '?' ])