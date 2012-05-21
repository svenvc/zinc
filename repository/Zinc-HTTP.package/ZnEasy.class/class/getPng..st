operations
getPng: urlObject
	"self getPng: 'http://www.pharo-project.org/images/pharo.png'."
	"(ZnEasy getPng: 'http://chart.googleapis.com/chart?cht=tx&chl=',
		'a^2+b^2=c^2' encodeForHTTP) asMorph openInHand."
	
	^ self 
		getImageOfType: ZnMimeType imagePng 
		usingParser: PNGReadWriter 
		fromUrl: urlObject 
	