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
				str: 'Try'; space;
				tag: #a attributes: #(href '/status') with: '/status'; space;
				tag: #a attributes: #(href '/echo-html') with: '/echo-html'; space;
				tag: #a attributes: #(href '/session') with: '/session'; space;
				tag: #a attributes: #(href '/unicode') with: '/unicode' ].
		html tag: #li do: [
			html
				str: 'All available routes'; space;
				tag: #a attributes: #(href '/routes') with: '/routes' ] ]