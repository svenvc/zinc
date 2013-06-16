description
describeOn: config 

	(config string: #openidRealm)
		group: #openid;
		label: 'OpenID Realm';
		comment: 'Authenticated realm. Identifies the domain that the end user is being asked to trust.'.