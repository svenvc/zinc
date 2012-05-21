instance creation
fieldName: fieldName fileName: fileName entity: entity
	^ self new
		setContentDisposition: 'form-data;name="', fieldName, '";filename="', fileName, '"';
		entity: entity;
		yourself