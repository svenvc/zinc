versions
version301: spec
	<version: '3.0.1' imports: #('3.0-baseline')>
	spec for: #pharo do: [ 
		spec 
			blessing: #release;
			description: 'Update to latest package versions';
			author: 'SvenVanCaekenberghe';
			package: 'Zinc-Character-Encoding-Core' with: 'Zinc-Character-Encoding-Core-SvenVanCaekenberghe.66';
			package: 'Zinc-Character-Encoding-Tests' with: 'Zinc-Character-Encoding-Tests-SvenVanCaekenberghe.46';
			package: 'Zinc-Resource-Meta-Core' with: 'Zinc-Resource-Meta-Core-SvenVanCaekenberghe.71';
			package: 'Zinc-Resource-Meta-Tests' with: 'Zinc-Resource-Meta-Tests-SvenVanCaekenberghe.39';
			package: 'Zinc-HTTP' with: 'Zinc-HTTP-SvenVanCaekenberghe.481';
			package: 'Zinc-HTTP-Examples' with: 'Zinc-HTTP-Examples-SvenVanCaekenberghe.3';
			package: 'Zinc-Tests' with: 'Zinc-Tests-SvenVanCaekenberghe.251';
			package: 'Zinc-Zodiac-Core' with: 'Zinc-Zodiac-Core-SvenVanCaekenberghe.1';
			package: 'Zinc-Zodiac-Tests' with: 'Zinc-Zodiac-Tests-SvenVanCaekenberghe.1';
			package: 'Zodiac-Core' with: 'Zodiac-Core-SvenVanCaekenberghe.49';
			package: 'Zodiac-Tests' with: 'Zodiac-Tests-SvenVanCaekenberghe.22';
			package: 'Zinc-Seaside' with: 'Zinc-Seaside-pmm.48';
			package: 'Zinc-REST' with: 'Zinc-REST-HolgerHansPeterFreyther.20';
			package: 'Zinc-WebSocket-Core' with: 'Zinc-WebSocket-Core-SvenVanCaekenberghe.30';
			package: 'Zinc-WebSocket-Tests' with: 'Zinc-WebSocket-Tests-LucFabresse.9';
			package: 'Zinc-AWS' with: 'Zinc-AWS-SvenVanCaekenberghe.18';
			package: 'Zinc-WebDAV' with: 'Zinc-WebDAV-SvenVanCaekenberghe.3';
			package: 'Zinc-SSO-OAuth1-Core' with: 'Zinc-SSO-OAuth1-Core-SvenVanCaekenberghe.13';
			package: 'Zinc-SSO-OAuth2-Core' with: 'Zinc-SSO-OAuth2-Core-JanVanDeSandt.20';
			package: 'Zinc-SSO-OpenID-Core' with: 'Zinc-SSO-OpenID-Core-JanVanDeSandt.6';
			package: 'Zinc-SSO-Demo' with: 'Zinc-SSO-Demo-SvenVanCaekenberghe.5';
			package: 'Zinc-SSO-OAuth1-Tests' with: 'Zinc-SSO-OAuth1-Tests-SvenVanCaekenberghe.2';
			package: 'Zinc-SSO-OpenID-Tests' with: 'Zinc-SSO-OpenID-Tests-JanVanDeSandt.3';
			package: 'Zinc-WWS-Client' with: 'Zinc-WWS-Client-PhilippeBack.3';
			package: 'Zinc-WWS-Server' with: 'Zinc-WWS-Server-SvenVanCaekenberghe.11' ]