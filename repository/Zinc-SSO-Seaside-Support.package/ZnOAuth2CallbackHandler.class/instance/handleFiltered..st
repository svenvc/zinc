handling
handleFiltered: aRequestContext
	"Handle the oauth2 callback by redirecting to the correct application. The path to
	this application should be in a request parameter called 'state'."

	| state newUrl |

	state := aRequestContext request at: 'state'.
	state notNil
		ifTrue: [ 
			newUrl := WAUrl absolute: state.
			aRequestContext request queryFields keysAndValuesDo: [ :name :value |
				name ~= 'state'
					ifTrue: [ newUrl addField: name value: value ] ].
			aRequestContext responseGenerator
				redirectTo: newUrl; 
				respond ]
		ifFalse: [
			aRequestContext responseGenerator
				notFound;
				respond ]