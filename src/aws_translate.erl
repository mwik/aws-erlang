%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc Provides translation between one source language and another of the
%% same set of languages.
-module(aws_translate).

-export([create_parallel_data/2,
         create_parallel_data/3,
         delete_parallel_data/2,
         delete_parallel_data/3,
         delete_terminology/2,
         delete_terminology/3,
         describe_text_translation_job/2,
         describe_text_translation_job/3,
         get_parallel_data/2,
         get_parallel_data/3,
         get_terminology/2,
         get_terminology/3,
         import_terminology/2,
         import_terminology/3,
         list_parallel_data/2,
         list_parallel_data/3,
         list_terminologies/2,
         list_terminologies/3,
         list_text_translation_jobs/2,
         list_text_translation_jobs/3,
         start_text_translation_job/2,
         start_text_translation_job/3,
         stop_text_translation_job/2,
         stop_text_translation_job/3,
         translate_text/2,
         translate_text/3,
         update_parallel_data/2,
         update_parallel_data/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Creates a parallel data resource in Amazon Translate by importing an
%% input file from Amazon S3.
%%
%% Parallel data files contain examples that show how you want segments of
%% text to be translated. By adding parallel data, you can influence the
%% style, tone, and word choice in your translation output.
create_parallel_data(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_parallel_data(Client, Input, []).
create_parallel_data(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateParallelData">>, Input, Options).

%% @doc Deletes a parallel data resource in Amazon Translate.
delete_parallel_data(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_parallel_data(Client, Input, []).
delete_parallel_data(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteParallelData">>, Input, Options).

%% @doc A synchronous action that deletes a custom terminology.
delete_terminology(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_terminology(Client, Input, []).
delete_terminology(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteTerminology">>, Input, Options).

%% @doc Gets the properties associated with an asynchronous batch translation
%% job including name, ID, status, source and target languages, input/output
%% S3 buckets, and so on.
describe_text_translation_job(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_text_translation_job(Client, Input, []).
describe_text_translation_job(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeTextTranslationJob">>, Input, Options).

%% @doc Provides information about a parallel data resource.
get_parallel_data(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_parallel_data(Client, Input, []).
get_parallel_data(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetParallelData">>, Input, Options).

%% @doc Retrieves a custom terminology.
get_terminology(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_terminology(Client, Input, []).
get_terminology(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetTerminology">>, Input, Options).

%% @doc Creates or updates a custom terminology, depending on whether or not
%% one already exists for the given terminology name.
%%
%% Importing a terminology with the same name as an existing one will merge
%% the terminologies based on the chosen merge strategy. Currently, the only
%% supported merge strategy is OVERWRITE, and so the imported terminology
%% will overwrite an existing terminology of the same name.
%%
%% If you import a terminology that overwrites an existing one, the new
%% terminology take up to 10 minutes to fully propagate and be available for
%% use in a translation due to cache policies with the DataPlane service that
%% performs the translations.
import_terminology(Client, Input)
  when is_map(Client), is_map(Input) ->
    import_terminology(Client, Input, []).
import_terminology(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ImportTerminology">>, Input, Options).

%% @doc Provides a list of your parallel data resources in Amazon Translate.
list_parallel_data(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_parallel_data(Client, Input, []).
list_parallel_data(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListParallelData">>, Input, Options).

%% @doc Provides a list of custom terminologies associated with your account.
list_terminologies(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_terminologies(Client, Input, []).
list_terminologies(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTerminologies">>, Input, Options).

%% @doc Gets a list of the batch translation jobs that you have submitted.
list_text_translation_jobs(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_text_translation_jobs(Client, Input, []).
list_text_translation_jobs(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTextTranslationJobs">>, Input, Options).

%% @doc Starts an asynchronous batch translation job.
%%
%% Batch translation jobs can be used to translate large volumes of text
%% across multiple documents at once. For more information, see `async'.
%%
%% Batch translation jobs can be described with the
%% `DescribeTextTranslationJob' operation, listed with the
%% `ListTextTranslationJobs' operation, and stopped with the
%% `StopTextTranslationJob' operation.
%%
%% Amazon Translate does not support batch translation of multiple source
%% languages at once.
start_text_translation_job(Client, Input)
  when is_map(Client), is_map(Input) ->
    start_text_translation_job(Client, Input, []).
start_text_translation_job(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"StartTextTranslationJob">>, Input, Options).

%% @doc Stops an asynchronous batch translation job that is in progress.
%%
%% If the job's state is `IN_PROGRESS', the job will be marked for
%% termination and put into the `STOP_REQUESTED' state. If the job completes
%% before it can be stopped, it is put into the `COMPLETED' state. Otherwise,
%% the job is put into the `STOPPED' state.
%%
%% Asynchronous batch translation jobs are started with the
%% `StartTextTranslationJob' operation. You can use the
%% `DescribeTextTranslationJob' or `ListTextTranslationJobs' operations to
%% get a batch translation job's `JobId'.
stop_text_translation_job(Client, Input)
  when is_map(Client), is_map(Input) ->
    stop_text_translation_job(Client, Input, []).
stop_text_translation_job(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"StopTextTranslationJob">>, Input, Options).

%% @doc Translates input text from the source language to the target
%% language.
%%
%% For a list of available languages and language codes, see
%% `what-is-languages'.
translate_text(Client, Input)
  when is_map(Client), is_map(Input) ->
    translate_text(Client, Input, []).
translate_text(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TranslateText">>, Input, Options).

%% @doc Updates a previously created parallel data resource by importing a
%% new input file from Amazon S3.
update_parallel_data(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_parallel_data(Client, Input, []).
update_parallel_data(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateParallelData">>, Input, Options).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), binary(), map(), list()) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map() | undefined,
    Error :: map().
request(Client, Action, Input, Options) ->
    RequestFun = fun() -> do_request(Client, Action, Input, Options) end,
    aws_request:request(RequestFun, Options).

do_request(Client, Action, Input0, Options) ->
    Client1 = Client#{service => <<"translate">>},
    Host = build_host(<<"translate">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.1">>},
        {<<"X-Amz-Target">>, <<"AWSShineFrontendService_20170701.", Action/binary>>}
    ],

    Input = Input0,

    Payload = jsx:encode(Input),
    SignedHeaders = aws_request:sign_request(Client1, <<"POST">>, URL, Headers, Payload),
    Response = hackney:request(post, URL, SignedHeaders, Payload, Options),
    handle_response(Response).

handle_response({ok, 200, ResponseHeaders, Client}) ->
    case hackney:body(Client) of
        {ok, <<>>} ->
            {ok, undefined, {200, ResponseHeaders, Client}};
        {ok, Body} ->
            Result = jsx:decode(Body),
            {ok, Result, {200, ResponseHeaders, Client}}
    end;
handle_response({ok, StatusCode, ResponseHeaders, Client}) ->
    {ok, Body} = hackney:body(Client),
    Error = jsx:decode(Body),
    {error, Error, {StatusCode, ResponseHeaders, Client}};
handle_response({error, Reason}) ->
    {error, Reason}.

build_host(_EndpointPrefix, #{region := <<"local">>, endpoint := Endpoint}) ->
    Endpoint;
build_host(_EndpointPrefix, #{region := <<"local">>}) ->
    <<"localhost">>;
build_host(EndpointPrefix, #{region := Region, endpoint := Endpoint}) ->
    aws_util:binary_join([EndpointPrefix, Region, Endpoint], <<".">>).

build_url(Host, Client) ->
    Proto = maps:get(proto, Client),
    Port = maps:get(port, Client),
    aws_util:binary_join([Proto, <<"://">>, Host, <<":">>, Port, <<"/">>], <<"">>).
