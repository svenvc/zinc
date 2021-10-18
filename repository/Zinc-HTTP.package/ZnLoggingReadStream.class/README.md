I am ZnLoggingReadStream, I wrap a binary stream and log all read operations.

At logLevel 1 (the default) I log read operations next and friends.
At logLevel 2 I also log peek and atEnd.

Usage

ZnServer default reader: [ :stream | 
	ZnRequest readFrom: 
		((ZnLoggingReadStream on: stream) identifier: 'Zn request') ].

ZnServer default reader: [ :stream | ZnRequest readFrom: stream ].

ZnZincServerAdaptor default server reader: [ :stream | 
	ZnRequest readBinaryFrom: 
		((ZnLoggingReadStream on: stream) identifier: 'Zn request') ].

ZnZincServerAdaptor default server reader: [ :stream | ZnRequest readBinaryFrom: stream ].

Part of Zinc HTTP Components.