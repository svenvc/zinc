private
httpClient
	^ ZnClient new
		systemPolicy;
		beOneShot;
		accept: ZnMimeType textPlain;
		url: self endpoint;
		yourself