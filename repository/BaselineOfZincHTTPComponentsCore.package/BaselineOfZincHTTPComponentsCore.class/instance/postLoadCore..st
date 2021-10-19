private
postLoadCore: spec
	"Packages that are part of `pharo-project/pharo`, e.g. `Zinc-HTTP` won't be updated to reflect this repository.
	Force the packages to be reloaded."
	| repository head |

	repository := IceRepository registry detect: [ :each | each name = 'zinc' ].
	head := repository head description.
	repository checkoutBranch: head.