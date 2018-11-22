baselines
baseline30: spec
	<version: '3.0-baseline'>
	spec for: #common do: [ 
		spec
			blessing: #baseline;
			description: 'Baseline for Zinc HTTP Components, a framework to deal with HTTP networking';
			author: 'SvenVanCaekenberghe';
			repository: 'http://mc.stfx.eu/ZincHTTPComponents'.
		spec baseline: 'NeoJSON' with: [ spec repository: 'github://svenvc/NeoJSON:master/repository' ].
		spec project: 'XML Support' with: [ spec className: 'ConfigurationOfXMLSupport'; repository: 'http://www.squeaksource.com/MetacelloRepository' ].
		spec package: 'Zodiac-Core' with: [ spec repository: 'http://mc.stfx.eu/Zodiac' ].
		spec package: 'Zodiac-Tests' with: [ spec repository: 'http://mc.stfx.eu/Zodiac' ].
		spec
			package: 'Zinc-Character-Encoding-Core';
			package: 'Zinc-Character-Encoding-Tests' with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
			package: 'Zinc-Resource-Meta-Core' with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
			package: 'Zinc-Resource-Meta-Tests' with: [ spec requires: 'Zinc-Resource-Meta-Core' ];
			package: 'Zinc-HTTP' with: [ spec requires: #('Zinc-Character-Encoding-Core' 'Zinc-Resource-Meta-Core') ];
			package: 'Zinc-HTTP-Examples' with: [ spec requires: #('Zinc-HTTP') ];
			package: 'Zinc-Tests' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-Zodiac-Core' with: [ spec requires: #('Zinc-HTTP' 'Zodiac-Core') ];
			package: 'Zinc-Zodiac-Tests' with: [ spec requires:  #('Zinc-Zodiac-Core') ].
		spec
			package: 'Zinc-Seaside';	"For now, no dependence on Seaside itself"
			package: 'Zinc-AWS' with: [ spec requires: #('Zinc-HTTP' 'XML Support') ];
			package: 'Zinc-REST' with: [ spec requires: #('Zinc-HTTP' 'NeoJSON') ];
			package: 'Zinc-WebSocket-Core' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-WebSocket-Tests' with: [ spec requires: 'Zinc-WebSocket-Core' ];
			package: 'Zinc-SSO-OAuth1-Core' with: [ spec requires: #('Zinc-HTTP' 'NeoJSON') ];
			package: 'Zinc-SSO-OAuth2-Core' with: [ spec requires: #('Zinc-HTTP' 'NeoJSON') ];
			package: 'Zinc-SSO-OpenID-Core' with: [ spec requires: #('Zinc-HTTP' 'XML Support') ];
			package: 'Zinc-SSO-Demo' with: [ spec requires: #('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth2-Core' 'Zinc-SSO-OpenID-Core') ];
			package: 'Zinc-SSO-OAuth1-Tests' with: [ spec requires: #('Zinc-SSO-OAuth1-Core') ];
			package: 'Zinc-SSO-OpenID-Tests' with: [ spec requires: #('Zinc-SSO-OpenID-Core') ];
			package: 'Zinc-WebDAV' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-WWS-Server' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-WWS-Client' with: [ spec requires: 'Zinc-HTTP' ].
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Zinc-HTTP' 'Zinc-HTTP-Examples' 'Zinc-Zodiac-Core');
			group: 'Tests' with: #('Zinc-Tests' 'Zinc-Character-Encoding-Tests' 'Zinc-Resource-Meta-Tests' 'Zodiac-Tests' 'Zinc-Zodiac-Tests');
			group: 'Character-Encoding' with: #('Zinc-Character-Encoding-Core' 'Zinc-Character-Encoding-Tests');
			group: 'Resource-Meta' with: #('Zinc-Resource-Meta-Core' 'Zinc-Resource-Meta-Tests');
			group: 'Zodiac' with: #('Zodiac-Core' 'Zodiac-Tests');
			group: 'AWS' with: #('Zinc-AWS');
			group: 'WebDAV' with: #('Zinc-WebDAV');
			group: 'WebSocket' with: #('Zinc-WebSocket-Core' 'Zinc-WebSocket-Tests');
			group: 'SSO-OAuth1' with: #('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth1-Tests');
			group: 'SSO-OAuth2' with: #('Zinc-SSO-OAuth2-Core');
			group: 'SSO-OpenID' with: #('Zinc-SSO-OpenID-Core' 'Zinc-SSO-OpenID-Tests');
			group: 'SSO-Demo' with: #('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth2-Core' 'Zinc-SSO-OpenID-Core');
			group: 'SSO' with: #('SSO-OAuth1' 'SSO-OAuth2' 'SSO-OpenID' 'SSO-Demo' 'Zinc-SSO-Demo');
			group: 'WWS' with: #('Zinc-WWS-Server' 'Zinc-WWS-Client');
			group: 'REST' with: #('Zinc-REST');
			group: 'Seaside' with: #('Zinc-Seaside') ]