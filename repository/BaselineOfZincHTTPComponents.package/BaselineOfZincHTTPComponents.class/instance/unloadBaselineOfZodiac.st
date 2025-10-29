doits
unloadBaselineOfZodiac
	"Recent Pharo versions already contain a BaselineOfZodiac,
	but it is a bogus one as Zinc-Zodiac-Tests is not a Zodiac package but a Zinc package.
	Due to a problem with Monticello, the baseline is not reloaded.
	Force a reload by unloading/removing it. This is a hack."

	(MCWorkingCopy hasPackageNamed: 'BaselineOfZodiac')
		ifTrue: [  
			(MCWorkingCopy forPackageNamed: 'BaselineOfZodiac') unload ]