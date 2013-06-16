ZnExampleStorageObjectsRestCall.

GET /storage/objects

	list all stored maps as a list of object-uris
	
GET /storage/objects?key1=value1&key2=value2

	as above with conjunctive condition specified 
	
POST /storage/objects <MAP>
	
	store a new map, returns the created object-uri

	#'object-uri' is a reserved key in MAP