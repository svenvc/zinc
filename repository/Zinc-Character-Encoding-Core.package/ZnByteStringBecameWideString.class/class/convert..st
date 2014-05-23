convenience
convert: byteString
	"Convert byteString to a wideString, signalling a notification"
	
	| wideString |
	wideString := QuadByteString withAll: byteString.
	self new
		byteString: byteString;
		wideString: wideString;
		signal.
	^ wideString