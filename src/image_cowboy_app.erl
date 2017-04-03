-module(image_cowboy_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
        {'_', [
               {"/", cowboy_static, 
               		{priv_dir, image_cowboy, "assets", 
               			[{mimetypes, cow_mimetypes, all}]
              	 	}
             	},
           
				{"/", my_handler, []}
			  ]
		}
  
]),
{ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
		{env, [{dispatch, Dispatch}]}]),
image_cowboy_sup:start_link().

stop(_State) ->
	ok.
