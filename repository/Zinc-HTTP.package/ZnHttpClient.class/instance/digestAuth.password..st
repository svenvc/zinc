accessing
digestAuth: username password: password
	| cred |
	cred := ZnDigestCredential new
				username: username;
				password: password;
				domain: self url authority;
				yourself.
	self session addCredential: cred