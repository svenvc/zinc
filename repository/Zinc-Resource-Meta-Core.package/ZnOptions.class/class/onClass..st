instance creation
onClass: targetClass
	| dictionary |
	dictionary := Dictionary new.
	(Pragma allNamed: #znOption in: targetClass class)
		do: [ :each |
			dictionary
				at: each method selector
				put: (each method methodClass instanceSide perform: each method selector) ].
	^ self new
		options: dictionary;
		writable: false;
		yourself