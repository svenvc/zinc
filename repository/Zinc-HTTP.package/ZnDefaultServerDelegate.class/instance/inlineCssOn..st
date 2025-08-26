private
inlineCssOn: html
	"Insert our inline CSS"

	html
		tag: #style
		attributes: #( type 'text/css' )
		with: self inlineCss