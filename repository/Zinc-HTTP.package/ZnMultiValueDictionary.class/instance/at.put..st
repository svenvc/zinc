as yet unclassified
at: aKey put: aValue
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject.
	Overridden to signal an exception when the limit, if present, is exceeded."


| hashVal anAssoc |

(aKey == nil) ifTrue: [ self errorNilKey ].
hashVal := self hashFunction: aKey.

anAssoc := self associationAtOrNil: aKey hash: hashVal.
(anAssoc == nil)
  ifTrue: [ (self limit notNil and: [ self size >= self limit ])
				ifTrue: [ (ZnTooManyDictionaryEntries limit: self limit) signal ].
    anAssoc := self class associationClass newWithKey: aKey value: aValue.
    anAssoc assignToSegment: self segment.
    self addNewAssociation: anAssoc hash: hashVal.
    ^ aValue
    ].

anAssoc value: aValue.
^ aValue

