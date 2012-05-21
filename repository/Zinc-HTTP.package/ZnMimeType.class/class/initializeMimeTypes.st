private
initializeMimeTypes 
	"To be extended later"

	MimeTypes := Dictionary new
		at: #applicationOctetStream put: (self main: 'application' sub: 'octet-stream');
		at: #applicationJavascript put: (self main: 'application' sub: 'javascript');
		at: #applicationJson put: (self main: 'application' sub: 'json');
		at: #applicationXml put: (self main: 'application' sub: 'xml');
		at: #applicationFormUrlEncoded put: (self main: 'application' sub: 'x-www-form-urlencoded');
		at: #imageGif put: (self main: 'image' sub: 'gif');
		at: #imageJpeg put: (self main: 'image' sub: 'jpeg');
		at: #imagePng put: (self main: 'image' sub: 'png');
		at: #textPlain put: ((self main: 'text' sub: 'plain') setCharSetUTF8; yourself);
		at: #textHtml put: ((self main: 'text' sub: 'html') setCharSetUTF8; yourself);
		at: #textCss put: (self main: 'text' sub: 'css');
		at: #textJavascript put: (self main: 'text' sub: 'javascript');
		at: #multiPartFormData put: (self main: 'multipart' sub: 'form-data');
		at: #any put: (self main: '*' sub: '*');
		at: #text put: (self main: 'text' sub: '*');
		yourself