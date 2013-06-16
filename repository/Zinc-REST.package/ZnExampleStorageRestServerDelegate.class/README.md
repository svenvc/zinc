I am ZnExampleStorageRestServerDelegate.

I offer a REST interface on /storage with CRUD operations on JSON maps. I automatically use the call hierarchy below ZnExampleStorageRestCall.

To install me you can do:

	ZnServer startDefaultOn: 1701.
	ZnServer default logToTranscript.

	ZnServer default delegate
		map: 'storage' 
		to: ZnExampleStorageRestServerDelegate new.
			
	ZnServer stopDefault.

See ZnExampleStorageRestServerDelegateTests for example client usage.
