parsing
parseServiceElement: aXmlElement
	"Parses xml element containing service definition. Method returns collection of services because
	every different type is parsed to different service."

	| types classes |
	types := OrderedCollection new.
	aXmlElement elementsAt: 'Type' do: [ :e | types add: e contentString ].
	classes := OrderedCollection new.
	types do: [ :type | classes addAll: (self allSubclasses select: [ :c | c serviceType = type ]) ].
	classes isEmpty
		ifTrue: [ ^ nil ].	"Unknonwn type"
	^ classes collect: [ :c | c newFromXmlElement: aXmlElement ]