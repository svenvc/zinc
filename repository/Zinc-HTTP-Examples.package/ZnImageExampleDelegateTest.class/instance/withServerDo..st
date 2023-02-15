private
withServerDo: block
	ZnServer withOSAssignedPortDo: [ :server |
		server delegate: ZnImageExampleDelegate new.
		block cull: server ]