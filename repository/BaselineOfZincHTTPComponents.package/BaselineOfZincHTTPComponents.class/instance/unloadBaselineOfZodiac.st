doits
unloadBaselineOfZodiac
"Newer Pharo versions includes an erroneous BaselineOfZodiac that breaks Zinc loading.
So, we remove this baseline to not take precedence over the one that Zinc will load and
avoiding magic tricks in the dependent projects.
Side note:
  In Pharo 7 `MCWorkingCopy>>hasPackageNamed:` returns the class instead of a 
  boolean 🤦"
	(((MCWorkingCopy hasPackageNamed: 'BaselineOfZodiac') == true)
    and: [ MCWorkingCopy respondsTo: #forPackageNamed: ])
		  ifTrue: [ (MCWorkingCopy forPackageNamed: 'BaselineOfZodiac') unload ]