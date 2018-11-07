initialization
forJsonREST
	"Configure me for JSON REST interaction: I assume that the entities that I read and write are JSON.
	This requires either NeoJSON or STON to be present."

	| reader writer |
	reader := self class environment
		at: #NeoJSONObject
		ifAbsent: [ 
			self class environment 
				at: #STONJSON 
				ifAbsent: [ self error: 'Could not find a suitabe JSON parser' ] ].
	writer := self class environment
		at: #NeoJSONWriter
		ifAbsent: [ 
			self class environment 
				at: #STONJSON 
				ifAbsent: [ self error: 'Could not find a suitabe JSON writer' ] ].
	self
		accept: ZnMimeType applicationJson;
		contentReader: [ :entity | reader fromString: entity contents ];
		contentWriter: [ :data | ZnEntity json: (writer toString: data) ]
