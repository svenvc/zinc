private
inlineCss
	"Return the CSS text for inline inclusion in our branded pages"

	^ Character space join:
	'body { color: black; background: white; width: 900px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 16px }
p { width: 800px; padding: 0 20px 10px 20px }
ul, ol { width: 800px; padding: 0 5px 5px 30px }
#logo { color: orange; font-family: Helvetica, sans-serif; font-weight: bold; font-size: 128px }' lines