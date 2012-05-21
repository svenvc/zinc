private
setSocketStreamParameters: stream
	stream 
		binary;
		shouldSignal: true;
		autoFlush: false;
		bufferSize: self class socketBufferSize;
		timeout: self class socketStreamTimeout.
