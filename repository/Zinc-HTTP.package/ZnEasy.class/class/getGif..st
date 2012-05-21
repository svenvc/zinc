operations
getGif: urlObject
	"self getGif: 'http://homepage.mac.com/svc/ADayAtTheBeach/calculator.gif'."
	
	^ self 
		getImageOfType: ZnMimeType imageGif 
		usingParser: GIFReadWriter 
		fromUrl: urlObject 
	