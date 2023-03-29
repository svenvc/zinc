baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec baseline: 'NeoJSON' with: [ 
				spec repository: 'github://svenvc/NeoJSON:master/repository' ].
		spec baseline: 'ZincHTTPComponentsCore' with: [ 
				spec repository: 'github://feenkcom/zinc/repository' ].
		
		spec
			package: 'Zinc-REST' with: [ spec requires: #('ZincHTTPComponentsCore' 'NeoJSON') ].
			
		"spec
			group: 'REST' with: #('Zinc-REST')" ]
