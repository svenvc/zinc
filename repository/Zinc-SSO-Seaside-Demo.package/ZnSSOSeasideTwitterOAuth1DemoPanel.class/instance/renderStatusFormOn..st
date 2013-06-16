rendering
renderStatusFormOn: html

	html form: [
		html label
			for: html nextId ;
			with: 'New Tweet:'.
		html break.
		html textInput
			id: html lastId ;
			size: 160 ;
			value: self defaulStatusText ;
			callback: [ :value | self actionUpdateStatus: value ].
		html submitButton 
			with: 'Post!' ]