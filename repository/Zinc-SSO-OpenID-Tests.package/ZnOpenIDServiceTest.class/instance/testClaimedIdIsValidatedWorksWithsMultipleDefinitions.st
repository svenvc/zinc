tests
testClaimedIdIsValidatedWorksWithsMultipleDefinitions
	| response service xrdsDocument |
	xrdsDocument := '<xrds:XRDS xmlns:xrds="xri://$xrds" xmlns="xri://$xrd*($v*2.0)">
<XRD>
<Service priority="0">
<Type>http://specs.openid.net/auth/2.0/signon</Type>
<Type>http://openid.net/srv/ax/1.0</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/mode/popup</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/icon</Type>
<Type>http://specs.openid.net/extensions/pape/1.0</Type>
<URI>https://www.google.com/accounts/o8/ud</URI>
</Service>
<Service priority="10">
<Type>http://specs.openid.net/auth/2.0/signon</Type>
<Type>http://openid.net/srv/ax/1.0</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/mode/popup</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/icon</Type>
<Type>http://specs.openid.net/extensions/pape/1.0</Type>
<URI>https://www.google.com/accounts/o8/ud?source=mail</URI>
</Service>
<Service priority="10">
<Type>http://specs.openid.net/auth/2.0/signon</Type>
<Type>http://openid.net/srv/ax/1.0</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/mode/popup</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/icon</Type>
<Type>http://specs.openid.net/extensions/pape/1.0</Type>
<URI>https://www.google.com/accounts/o8/ud?source=gmail.com</URI>
</Service>
<Service priority="10">
<Type>http://specs.openid.net/auth/2.0/signon</Type>
<Type>http://openid.net/srv/ax/1.0</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/mode/popup</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/icon</Type>
<Type>http://specs.openid.net/extensions/pape/1.0</Type>
<URI>https://www.google.com/accounts/o8/ud?source=googlemail.com</URI>
</Service>
<Service priority="10">
<Type>http://specs.openid.net/auth/2.0/signon</Type>
<Type>http://openid.net/srv/ax/1.0</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/mode/popup</Type>
<Type>http://specs.openid.net/extensions/ui/1.0/icon</Type>
<Type>http://specs.openid.net/extensions/pape/1.0</Type>
<URI>https://www.google.com/accounts/o8/ud?source=profiles</URI>
</Service>
</XRD>
</xrds:XRDS>'.
	response := self defaultAuthResponse
		propertyAt: 'openid.op_endpoint' put: 'https://www.google.com/accounts/o8/ud?source=profiles';
		yourself.
	service := ZnOpenIDServiceDummy new
		doNotCheckSignature ;
		claimedId: response claimedId xrds: xrdsDocument ;
		provider: self dummyProvider ;
		yourself.
	"self shouldnt: [ "service validateAuthResponse: response." ] raise: CFOpenIDClaimedIDVerificationError"