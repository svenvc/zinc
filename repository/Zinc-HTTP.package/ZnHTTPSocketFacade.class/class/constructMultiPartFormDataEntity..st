private
constructMultiPartFormDataEntity: arguments
	| entity |
	entity := ZnMultiPartFormDataEntity new.
	arguments keysAndValuesDo: [ :key :values |
		values do: [ :value |
			entity addPart: ((value isKindOf: MIMEDocument)
				ifFalse: [ 
					 ZnMimePart fieldName: key value: value ]
				ifTrue: [ | fileEntity contents |
					contents := value content isNil 
						ifTrue: [ (FileStream fileNamed: value url pathForFile) contentsOfEntireFile ] 
						ifFalse: [ value content ].
					fileEntity := ZnEntity with: contents type: value contentType.
					ZnMimePart fieldName: key fileName: value url pathForFile entity: fileEntity ]) ] ].
	^ entity
