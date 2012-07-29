private
parsePropFindResponse: string
	^ ((XMLDOMParser parse: string) 
			allElementsNamed: 'response') 
				collect: [ :each |
					each contentStringAt: 'href' ]