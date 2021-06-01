baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec baseline: 'NeoJSON' with: [ 
				spec repository: 'github://svenvc/NeoJSON:v17/repository' ].
		spec baseline: 'ZincHTTPComponentsCore' with: [ 
				spec repository: 'github://feenkcom/zinc:v3.1.1-gt/repository' ].
		
		spec
			package: 'Zinc-REST' with: [ spec requires: #('ZincHTTPComponentsCore' 'NeoJSON') ].
			
		"spec
			group: 'REST' with: #('Zinc-REST')" ]