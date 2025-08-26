private
welcomePageLinksOn: html
	"Add our welcome page links"

	html tag: #ul do: [
		html tag: #li do: [
			html
				str: 'GitHub project page'; space;
				tag: #a attributes: #(href 'https://github.com/svenvc/zinc') with: 'https://github.com/svenvc/zinc' ].
		html tag: #li do: [
			html
				str: 'Live cloud instance'; space;
				tag: #a attributes: #(href 'https://zn.stfx.eu') with: 'https://zn.stfx.eu' ].
		html tag: #li do: [
			html
				str: 'Locally available pages'; space;
				tag: #a attributes: #(href '/help') with: '/help' ] ]