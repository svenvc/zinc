public
handleStoreContents
	"Handle GET /kvstore - list the full contents of the key-valyue store"

	^ ZnResponse ok: (ZnEntity text: self storeContents)