private
newConnection
	self log debug: 'Opening connection'.
	^ ZnNetworkingUtils socketStreamToUrl: self baseUrl 