doits
recompileZnLogEventHierarchy
	"This is a hack, but somehow there is something wrong in the instance variables layout, 
	which can only be fixed by recompiling, which should happen but doesn't, so force it."

	ZnLogEvent withAllSubclassesDo: #recompile