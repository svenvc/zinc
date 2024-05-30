baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 

		spec baseline: 'ZincHTTPComponentsCore' with: [ 
				spec repository: 'github://feenkcom/zinc/repository' ].
		
		spec
			package: 'Zinc-WebSocket-Core' with: [ spec requires: 'ZincHTTPComponentsCore' ];
			package: 'Zinc-WebSocket-Tests' with: [ spec requires: 'Zinc-WebSocket-Core' ].
			
		"spec
			group: 'WebSocket' with: #('Zinc-WebSocket-Core' 'Zinc-WebSocket-Tests')" ]
