enumerating
withServerDo: block
	ZnServer withOSAssignedPortDo: [ :server |
		server delegate: ZnUrlShortenerDelegate new.
		block cull: server ]