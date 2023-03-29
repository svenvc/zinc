public
installInDefaultServer
	"Assuming the default server has the default delegate,
	install ourself under /kvstore"

	ZnServer default delegate
		map: 'kvstore' to: self new