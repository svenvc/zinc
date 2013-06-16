resources
authenticationResultSignedText

	^'op_endpoint:https://www.google.com/accounts/o8/ud
claimed_id:https://www.google.com/accounts/o8/id?id=AItOawnFQzS9_B505VJ_fNmY14ZywzVOINjI22k
identity:https://www.google.com/accounts/o8/id?id=AItOawnFQzS9_B505VJ_fNmY14ZywzVOINjI22k
return_to:http://pier.doit.st
response_nonce:2010-03-05T10:40:06ZJ6jQJGQatr63qw
assoc_handle:AOQobUe4qad3I-VsAjGHVmxz_KeE0V1GHKW29cOaA2jNJphIjkYbjeYU
ns.ext1:http://openid.net/srv/ax/1.0
ext1.mode:fetch_response
ext1.type.firstname:http://axschema.org/namePerson/first
ext1.value.firstname:Jan
ext1.type.email:http://axschema.org/contact/email
ext1.value.email:jvdsandt@gmail.com
ext1.type.lastname:http://axschema.org/namePerson/last
ext1.value.lastname:van de Sandt
' collect: [ :ch | ch = Character cr ifTrue: [ Character lf ] ifFalse: [ ch ]]