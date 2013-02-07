actions
getValidatedAuthenticationResponseFrom: aDictionary

	| responseMessage |

	responseMessage := self getAuthenticationResponseFrom: aDictionary.
	responseMessage isSuccess 
		ifTrue: [ self validateAuthResponse: responseMessage ].
	^ responseMessage 
