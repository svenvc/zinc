private-protocol
prepareData: dataEntity
	"Prepare the ZnEntity for the request."
	
	dataEntity ifNil: [ ^ dataEntity ].
	(dataEntity isKindOf: ZnEntity) ifTrue: [ ^ dataEntity ].
	^ ZnApplicationFormUrlEncodedEntity withAll: dataEntity