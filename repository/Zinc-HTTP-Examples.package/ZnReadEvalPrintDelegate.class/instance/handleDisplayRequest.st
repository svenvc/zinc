request handling
handleDisplayRequest
	^ ZnResponse ok: (ZnEntity with: self currentWorldAsPng type: ZnMimeType imagePng)