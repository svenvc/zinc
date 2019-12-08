I am ZnKeyValueStoreClient, I access the REST API of ZnKeyValueStoreDelegate.

API

  #at: key - return the value stored under key, KeyNotFound if absent
  #at: key ifAbsent: block - return the value stored under key, evaluate block if absent
  #at: key put: value - store value under key
  #removeKey: key - remove key
  #contents - return a dictionary of all keys and values

Keys and values should be strings or will be converted using #asString.

See ZnKeyValueStoreTest for an executable example.

Part of Zinc HTTP Components.