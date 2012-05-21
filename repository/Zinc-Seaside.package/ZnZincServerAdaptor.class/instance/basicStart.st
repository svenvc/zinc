private
basicStart
	self server
		delegate: self delegate;
		reader: [ :stream "Seaside wants to do its own text conversions" | ZnRequest readBinaryFrom: stream ];
		start