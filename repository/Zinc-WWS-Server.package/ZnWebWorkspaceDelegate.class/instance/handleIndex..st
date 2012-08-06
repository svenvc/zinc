private request handling
handleIndex: request
	^ ZnResponse ok: (ZnEntity html: self generateHomepage)