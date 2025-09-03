I am ZnOptions, a object that holds key/value options for configuration, parameterization and settings.

Option objects contain key/value pairs and inherit from a parent.
They can be writeable or readonly.

Clients typically refer to option using the ZnCurrentOptions dynamic variable.

	ZnCurrentOptions at: #myOption
	
The top level, global default is typically on my class side marked by the <znOption> pragma.

I hold the #globalDefault options.

Options can be cloned to make them writeable.

Options can changed and activated using #during:

ZnOptions globalDefault clone
	at: #myOption put: 'newValue';
	during: [ ZnCurrentOptions at: #myOption ].

ZnClient and ZnServer instances hold and apply their own local options.
They use or #conditionallyDuring: to allow an enclosing #during: to take precedence.
