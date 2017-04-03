-module(my_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
	{ok, Reply} = cowboy_req:reply(
        200,
        [],
        <<"A static image">>, Req),
{ok, Reply, State}.

terminate(_Reason, _Req, _State) ->
	ok.
