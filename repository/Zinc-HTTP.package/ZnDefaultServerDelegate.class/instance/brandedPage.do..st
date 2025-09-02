private
brandedPage: title do: block
	"Helper to generate uniform HTML pages"

	^ ZnHtmlOutputStream streamContents: [ :html |
		html html5; tag: #html do: [
			html
				tag: #head do: [
					html tag: #title with: title.
					self inlineCssOn: html ];
				tag: #body do: [
					html tag: #a attributes: #(id logo href '/') with: #Zn.
					html tag: #h1 with: title.
					block cull: html ] ] ]