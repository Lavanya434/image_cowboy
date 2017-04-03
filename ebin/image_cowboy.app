{application, 'image_cowboy', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['image_cowboy_app','image_cowboy_sup','my_handler']},
	{registered, [image_cowboy_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {image_cowboy_app, []}},
	{env, []}
]}.