I convert between Seaside and Zinc HTTP requests and responses.

Instance Variables:
	server	<ZnServer>
		
I can be started like any other Seaside adaptor:

	ZnZincServerAdaptor startOn: 8080
	
It is also possible to further customize me, like this:

	ZnZincServerAdaptor new
		port: 8080;
		serverClass: ZnManagingMultiThreadedServer;
		start