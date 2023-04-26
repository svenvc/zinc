private
getImageOfType: mimeType fromUrl: urlObject
	| client |
	(client := self client)
		url: urlObject;
		accept: mimeType;
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		get.
	"ImageReadWriter does automatic type detection"
	^ (self environment at: #ImageReadWriter) formFromStream: client entity readStream