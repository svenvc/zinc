rendering
renderAnchor: aBlock title: aTitle imageUrl: anUrl target: aTarget on: html

	html div
		class: 'provider-link' ;
		with: [
			html anchor
				target: aTarget ;
				callback: aBlock ;
				with: [
					html image
						altText: aTitle ;
						title: aTitle ;
						url: anUrl ] ]