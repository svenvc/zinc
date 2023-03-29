json
defaultJSONWriter
	"Configure me for JSON REST interaction: I assume that the entities that I read and write are JSON.
	This requires either NeoJSON or STON to be present."

	| writer |
	writer := self class environment at: #NeoJSONWriter ifAbsent: [
		          self class environment
			          at: #STONJSON
			          ifAbsent: [
			          self error: 'Could not find a suitabe JSON writer' ] ].

	^ writer