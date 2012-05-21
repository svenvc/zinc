private
execute: request on: stream
	"All our requests are one shot"
	
	request setConnectionClose.
	^ [ 
		request writeOn: stream.
		stream flush.
		ZnResponse readFrom: stream ] ensure: [ stream close ]