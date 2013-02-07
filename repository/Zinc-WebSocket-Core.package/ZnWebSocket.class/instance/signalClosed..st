private
signalClosed: frame
	"Turn a close frame that we received into a ZnWebSocketClosed exception and signal it."
	
	| exception |
	exception := ZnWebSocketClosed new.
	frame isEmpty 
		ifFalse: [
			exception 
				code: frame closeCode;
				reason: frame closeReason ].
	exception signal.