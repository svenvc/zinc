I am ZnLogSupport, I help HTTP servers and clients to manage ZnLogEvents.

To use the logging framework, instanciate your own log support: 

	log := ZnLogSupport new.

and use it to log messages:

	log info: 'Started server'.
	log debug: [ 'Created ', someComplexObject printString ].

To view the log, add a log listener:

	log addListener: ZnTranscriptLogger new.
	
Make sure to enable your log support as it is off by default:

	log enabled: true.

Part of Zinc HTTP Components.