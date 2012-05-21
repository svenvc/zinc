private
initializeExtensionsMap 
	"To be extended later"
	
	ExtensionsMap := Dictionary new
		at: 'txt' put: self textPlain;
		at: 'text' put: self textPlain;
		at: 'htm' put: self textHtml;
		at: 'html' put: self textHtml;
		at: 'gif' put: self imageGif;
		at: 'jpg' put: self imageJpeg;
		at: 'jpeg' put: self imageJpeg;
		at: 'png' put: self imagePng;
		at: 'js' put: self applicationJavascript;
		at: 'xml' put: self applicationXml;
		at: 'css' put: self textCss;
		yourself