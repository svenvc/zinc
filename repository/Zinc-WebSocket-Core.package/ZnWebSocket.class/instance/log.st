accessing
log
	^ log ifNil: [ log := ZnLogSupport new ]