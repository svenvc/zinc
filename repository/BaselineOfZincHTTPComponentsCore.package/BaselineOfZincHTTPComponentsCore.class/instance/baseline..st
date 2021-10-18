baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 	
		spec baseline: 'ZodiacCore' with: [ 
			spec 
				repository: 'github://feenkcom/zodiac/repository' ]. 
		
		spec
			package: 'Zinc-Character-Encoding-Core';
			package: 'Zinc-Character-Encoding-Tests' with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
			package: 'Zinc-Resource-Meta-Core' with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
			package: 'Zinc-Resource-Meta-Tests' with: [ spec requires: 'Zinc-Resource-Meta-Core' ];
			package: 'Zinc-HTTP' with: [ spec requires: #('Zinc-Character-Encoding-Core' 'Zinc-Resource-Meta-Core') ];
			package: 'Zinc-HTTP-Examples' with: [ spec requires: #('Zinc-HTTP') ];
			package: 'Zinc-Tests' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-Zodiac-Core' with: [ spec requires: #('Zinc-HTTP' 'ZodiacCore') ];
			package: 'Zinc-Zodiac-Tests' with: [ spec requires:  #('Zinc-Zodiac-Core') ].
		
		"spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Zinc-HTTP' 'Zinc-HTTP-Examples' 'Zinc-Zodiac-Core');
			group: 'Tests' with: #('Zinc-Tests' 'Zinc-Character-Encoding-Tests' 'Zinc-Resource-Meta-Tests' 'Zinc-Zodiac-Tests')" ]