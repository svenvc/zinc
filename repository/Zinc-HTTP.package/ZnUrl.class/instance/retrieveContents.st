downloading
retrieveContents
	"Download and return the resource that I refer to.
	This will typically return a String or a ByteArray (see ZnClient>>#get:).
	If something goes wrong, an exception will be signalled."
	
	" 'http://zn.stfx.eu/zn/numbers.txt' asZnUrl retrieveContents. "
	
	^ ZnClient new
		beOneShot;
		enforceHttpSuccess: true;
		get: self