accessing
logGeneric: subject
	ZnWebSocketGenericLogEvent new
		subject: subject;
		emit