protocol
distributeMessage: message 
	"Send message to all client WebSockets that we know."
	
	lock critical: [
		webSockets do: [ :each |
			[ each sendMessage: message ]
				on: NetworkError 
				do: [ :exception |
					"We can ignore this (instead of #unregister:-ing the offender), 
					since the listener process (see #value:) will do the right thing" 
					each logGeneric: exception printString, ' in ditributeMessage, ignoring' ] ] ]