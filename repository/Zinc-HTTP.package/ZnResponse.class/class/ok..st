instance creation
ok: entity
	^ self new
		statusLine: (ZnStatusLine ok);
		headers: ZnHeaders defaultResponseHeaders;
		entity: entity;
		yourself