tests
testMultipleTypesOnService

	| xrdsDocument expected services |

	xrdsDocument := '<xrds:XRDS xmlns="xri://$xrd*($v*2.0)" xmlns:xrds="xri://$xrds"><XRD><Service priority="0">
 <Type>http://specs.openid.net/auth/2.0/signon</Type>
 <Type>http://openid.net/srv/ax/1.0</Type>
 <Type>http://specs.openid.net/extensions/ui/1.0/mode/popup</Type>
 <Type>http://specs.openid.net/extensions/ui/1.0/icon</Type>
 <Type>http://specs.openid.net/extensions/pape/1.0</Type>
<URI>endpointabcd</URI><LocalID>localid123</LocalID></Service></XRD></xrds:XRDS>'.
	expected := ZnXRDOpenIDClaimedId new
		opEndpoint: 'endpointabcd';
		localId: 'localid123';
		yourself.
	services := ZnXRDService parseServicesFromXrds: xrdsDocument.
	self assert: (services anySatisfy: [ :e | e = expected ])