private
postLoadCore: spec
	"Packages that are part of `pharo-project/pharo`, e.g. `Zinc-HTTP` won't be updated to reflect this repository.
	Force the packages to be reloaded."
	| repository head |

	repository := IceRepository registry detect: [ :each | each name = 'zinc' ].
	head := repository head description.
	repository checkoutBranch: head.
	
	"This is a hack, but somehow there is something wrong in the instance variables layout, 
	which can only be fixed by recompiling, which should happen but doesn't, so force it.
	
	ported from a postload in zinc"

	ZnLogEvent withAllSubclassesDo: #recompile