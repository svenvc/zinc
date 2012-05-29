as yet unclassified
add: anAssociation
	"Overridden to signal an exception when the limit, if present, is exceeded."


| aKey hashVal anAssoc |

aKey := anAssociation key.
hashVal := self hashFunction: aKey.

anAssoc := self associationAtOrNil: aKey hash: hashVal.
(anAssoc == nil)
  ifTrue: [(self limit notNil and: [ self size >= self limit ])
				ifTrue: [ (ZnTooManyDictionaryEntries limit: self limit) signal ].
    anAssociation assignToSegment: self segment.
    self addNewAssociation: anAssociation hash: hashVal.
    ^ anAssociation.
    ].

anAssoc value: (anAssociation value).
^ anAssociation.

