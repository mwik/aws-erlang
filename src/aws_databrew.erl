%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc AWS Glue DataBrew is a visual, cloud-scale data-preparation service.
%%
%% DataBrew simplifies data preparation tasks, targeting data issues that are
%% hard to spot and time-consuming to fix. DataBrew empowers users of all
%% technical levels to visualize the data and perform one-click data
%% transformations, with no coding required.
-module(aws_databrew).

-export([batch_delete_recipe_version/3,
         batch_delete_recipe_version/4,
         create_dataset/2,
         create_dataset/3,
         create_profile_job/2,
         create_profile_job/3,
         create_project/2,
         create_project/3,
         create_recipe/2,
         create_recipe/3,
         create_recipe_job/2,
         create_recipe_job/3,
         create_schedule/2,
         create_schedule/3,
         delete_dataset/3,
         delete_dataset/4,
         delete_job/3,
         delete_job/4,
         delete_project/3,
         delete_project/4,
         delete_recipe_version/4,
         delete_recipe_version/5,
         delete_schedule/3,
         delete_schedule/4,
         describe_dataset/2,
         describe_dataset/3,
         describe_job/2,
         describe_job/3,
         describe_job_run/3,
         describe_job_run/4,
         describe_project/2,
         describe_project/3,
         describe_recipe/3,
         describe_recipe/4,
         describe_schedule/2,
         describe_schedule/3,
         list_datasets/3,
         list_datasets/4,
         list_job_runs/4,
         list_job_runs/5,
         list_jobs/5,
         list_jobs/6,
         list_projects/3,
         list_projects/4,
         list_recipe_versions/4,
         list_recipe_versions/5,
         list_recipes/4,
         list_recipes/5,
         list_schedules/4,
         list_schedules/5,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         publish_recipe/3,
         publish_recipe/4,
         send_project_session_action/3,
         send_project_session_action/4,
         start_job_run/3,
         start_job_run/4,
         start_project_session/3,
         start_project_session/4,
         stop_job_run/4,
         stop_job_run/5,
         tag_resource/3,
         tag_resource/4,
         untag_resource/3,
         untag_resource/4,
         update_dataset/3,
         update_dataset/4,
         update_profile_job/3,
         update_profile_job/4,
         update_project/3,
         update_project/4,
         update_recipe/3,
         update_recipe/4,
         update_recipe_job/3,
         update_recipe_job/4,
         update_schedule/3,
         update_schedule/4]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Deletes one or more versions of a recipe at a time.
%%
%% The entire request will be rejected if:
%%
%% <ul> <li> The recipe does not exist.
%%
%% </li> <li> There is an invalid version identifier in the list of versions.
%%
%% </li> <li> The version list is empty.
%%
%% </li> <li> The version list size exceeds 50.
%%
%% </li> <li> The version list contains duplicate entries.
%%
%% </li> </ul> The request will complete successfully, but with partial
%% failures, if:
%%
%% <ul> <li> A version does not exist.
%%
%% </li> <li> A version is being used by a job.
%%
%% </li> <li> You specify `LATEST_WORKING', but it's being used by a project.
%%
%% </li> <li> The version fails to be deleted.
%%
%% </li> </ul> The `LATEST_WORKING' version will only be deleted if the
%% recipe has no other versions. If you try to delete `LATEST_WORKING' while
%% other versions exist (or if they can't be deleted), then `LATEST_WORKING'
%% will be listed as partial failure in the response.
batch_delete_recipe_version(Client, Name, Input) ->
    batch_delete_recipe_version(Client, Name, Input, []).
batch_delete_recipe_version(Client, Name, Input0, Options) ->
    Method = post,
    Path = ["/recipes/", aws_util:encode_uri(Name), "/batchDeleteRecipeVersion"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates a new DataBrew dataset.
create_dataset(Client, Input) ->
    create_dataset(Client, Input, []).
create_dataset(Client, Input0, Options) ->
    Method = post,
    Path = ["/datasets"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates a new job to analyze a dataset and create its data profile.
create_profile_job(Client, Input) ->
    create_profile_job(Client, Input, []).
create_profile_job(Client, Input0, Options) ->
    Method = post,
    Path = ["/profileJobs"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates a new DataBrew project.
create_project(Client, Input) ->
    create_project(Client, Input, []).
create_project(Client, Input0, Options) ->
    Method = post,
    Path = ["/projects"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates a new DataBrew recipe.
create_recipe(Client, Input) ->
    create_recipe(Client, Input, []).
create_recipe(Client, Input0, Options) ->
    Method = post,
    Path = ["/recipes"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates a new job to transform input data, using steps defined in an
%% existing AWS Glue DataBrew recipe
create_recipe_job(Client, Input) ->
    create_recipe_job(Client, Input, []).
create_recipe_job(Client, Input0, Options) ->
    Method = post,
    Path = ["/recipeJobs"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates a new schedule for one or more DataBrew jobs.
%%
%% Jobs can be run at a specific date and time, or at regular intervals.
create_schedule(Client, Input) ->
    create_schedule(Client, Input, []).
create_schedule(Client, Input0, Options) ->
    Method = post,
    Path = ["/schedules"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Deletes a dataset from DataBrew.
delete_dataset(Client, Name, Input) ->
    delete_dataset(Client, Name, Input, []).
delete_dataset(Client, Name, Input0, Options) ->
    Method = delete,
    Path = ["/datasets/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Deletes the specified DataBrew job.
delete_job(Client, Name, Input) ->
    delete_job(Client, Name, Input, []).
delete_job(Client, Name, Input0, Options) ->
    Method = delete,
    Path = ["/jobs/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Deletes an existing DataBrew project.
delete_project(Client, Name, Input) ->
    delete_project(Client, Name, Input, []).
delete_project(Client, Name, Input0, Options) ->
    Method = delete,
    Path = ["/projects/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Deletes a single version of a DataBrew recipe.
delete_recipe_version(Client, Name, RecipeVersion, Input) ->
    delete_recipe_version(Client, Name, RecipeVersion, Input, []).
delete_recipe_version(Client, Name, RecipeVersion, Input0, Options) ->
    Method = delete,
    Path = ["/recipes/", aws_util:encode_uri(Name), "/recipeVersion/", aws_util:encode_uri(RecipeVersion), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Deletes the specified DataBrew schedule.
delete_schedule(Client, Name, Input) ->
    delete_schedule(Client, Name, Input, []).
delete_schedule(Client, Name, Input0, Options) ->
    Method = delete,
    Path = ["/schedules/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Returns the definition of a specific DataBrew dataset.
describe_dataset(Client, Name)
  when is_map(Client) ->
    describe_dataset(Client, Name, []).
describe_dataset(Client, Name, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/datasets/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Returns the definition of a specific DataBrew job.
describe_job(Client, Name)
  when is_map(Client) ->
    describe_job(Client, Name, []).
describe_job(Client, Name, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/jobs/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Represents one run of a DataBrew job.
describe_job_run(Client, Name, RunId)
  when is_map(Client) ->
    describe_job_run(Client, Name, RunId, []).
describe_job_run(Client, Name, RunId, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/jobs/", aws_util:encode_uri(Name), "/jobRun/", aws_util:encode_uri(RunId), ""],
    SuccessStatusCode = undefined,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Returns the definition of a specific DataBrew project.
describe_project(Client, Name)
  when is_map(Client) ->
    describe_project(Client, Name, []).
describe_project(Client, Name, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/projects/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Returns the definition of a specific DataBrew recipe corresponding to
%% a particular version.
describe_recipe(Client, Name, RecipeVersion)
  when is_map(Client) ->
    describe_recipe(Client, Name, RecipeVersion, []).
describe_recipe(Client, Name, RecipeVersion, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/recipes/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"recipeVersion">>, RecipeVersion}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Returns the definition of a specific DataBrew schedule.
describe_schedule(Client, Name)
  when is_map(Client) ->
    describe_schedule(Client, Name, []).
describe_schedule(Client, Name, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/schedules/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists all of the DataBrew datasets.
list_datasets(Client, MaxResults, NextToken)
  when is_map(Client) ->
    list_datasets(Client, MaxResults, NextToken, []).
list_datasets(Client, MaxResults, NextToken, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/datasets"],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists all of the previous runs of a particular DataBrew job.
list_job_runs(Client, Name, MaxResults, NextToken)
  when is_map(Client) ->
    list_job_runs(Client, Name, MaxResults, NextToken, []).
list_job_runs(Client, Name, MaxResults, NextToken, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/jobs/", aws_util:encode_uri(Name), "/jobRuns"],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists all of the DataBrew jobs that are defined.
list_jobs(Client, DatasetName, MaxResults, NextToken, ProjectName)
  when is_map(Client) ->
    list_jobs(Client, DatasetName, MaxResults, NextToken, ProjectName, []).
list_jobs(Client, DatasetName, MaxResults, NextToken, ProjectName, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/jobs"],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"datasetName">>, DatasetName},
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken},
        {<<"projectName">>, ProjectName}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists all of the DataBrew projects that are defined.
list_projects(Client, MaxResults, NextToken)
  when is_map(Client) ->
    list_projects(Client, MaxResults, NextToken, []).
list_projects(Client, MaxResults, NextToken, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/projects"],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists the versions of a particular DataBrew recipe, except for
%% `LATEST_WORKING'.
list_recipe_versions(Client, MaxResults, Name, NextToken)
  when is_map(Client) ->
    list_recipe_versions(Client, MaxResults, Name, NextToken, []).
list_recipe_versions(Client, MaxResults, Name, NextToken, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/recipeVersions"],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"maxResults">>, MaxResults},
        {<<"name">>, Name},
        {<<"nextToken">>, NextToken}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists all of the DataBrew recipes that are defined.
list_recipes(Client, MaxResults, NextToken, RecipeVersion)
  when is_map(Client) ->
    list_recipes(Client, MaxResults, NextToken, RecipeVersion, []).
list_recipes(Client, MaxResults, NextToken, RecipeVersion, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/recipes"],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken},
        {<<"recipeVersion">>, RecipeVersion}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists the DataBrew schedules that are defined.
list_schedules(Client, JobName, MaxResults, NextToken)
  when is_map(Client) ->
    list_schedules(Client, JobName, MaxResults, NextToken, []).
list_schedules(Client, JobName, MaxResults, NextToken, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/schedules"],
    SuccessStatusCode = undefined,

    Headers = [],

    Query0_ =
      [
        {<<"jobName">>, JobName},
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Lists all the tags for a DataBrew resource.
list_tags_for_resource(Client, ResourceArn)
  when is_map(Client) ->
    list_tags_for_resource(Client, ResourceArn, []).
list_tags_for_resource(Client, ResourceArn, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/tags/", aws_util:encode_uri(ResourceArn), ""],
    SuccessStatusCode = undefined,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Publishes a new version of a DataBrew recipe.
publish_recipe(Client, Name, Input) ->
    publish_recipe(Client, Name, Input, []).
publish_recipe(Client, Name, Input0, Options) ->
    Method = post,
    Path = ["/recipes/", aws_util:encode_uri(Name), "/publishRecipe"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Performs a recipe step within an interactive DataBrew session that's
%% currently open.
send_project_session_action(Client, Name, Input) ->
    send_project_session_action(Client, Name, Input, []).
send_project_session_action(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/projects/", aws_util:encode_uri(Name), "/sendProjectSessionAction"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Runs a DataBrew job.
start_job_run(Client, Name, Input) ->
    start_job_run(Client, Name, Input, []).
start_job_run(Client, Name, Input0, Options) ->
    Method = post,
    Path = ["/jobs/", aws_util:encode_uri(Name), "/startJobRun"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates an interactive session, enabling you to manipulate data in a
%% DataBrew project.
start_project_session(Client, Name, Input) ->
    start_project_session(Client, Name, Input, []).
start_project_session(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/projects/", aws_util:encode_uri(Name), "/startProjectSession"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Stops a particular run of a job.
stop_job_run(Client, Name, RunId, Input) ->
    stop_job_run(Client, Name, RunId, Input, []).
stop_job_run(Client, Name, RunId, Input0, Options) ->
    Method = post,
    Path = ["/jobs/", aws_util:encode_uri(Name), "/jobRun/", aws_util:encode_uri(RunId), "/stopJobRun"],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Adds metadata tags to a DataBrew resource, such as a dataset,
%% project, recipe, job, or schedule.
tag_resource(Client, ResourceArn, Input) ->
    tag_resource(Client, ResourceArn, Input, []).
tag_resource(Client, ResourceArn, Input0, Options) ->
    Method = post,
    Path = ["/tags/", aws_util:encode_uri(ResourceArn), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Removes metadata tags from a DataBrew resource.
untag_resource(Client, ResourceArn, Input) ->
    untag_resource(Client, ResourceArn, Input, []).
untag_resource(Client, ResourceArn, Input0, Options) ->
    Method = delete,
    Path = ["/tags/", aws_util:encode_uri(ResourceArn), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    QueryMapping = [
                     {<<"tagKeys">>, <<"TagKeys">>}
                   ],
    {Query_, Input} = aws_request:build_headers(QueryMapping, Input1),
    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Modifies the definition of an existing DataBrew dataset.
update_dataset(Client, Name, Input) ->
    update_dataset(Client, Name, Input, []).
update_dataset(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/datasets/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Modifies the definition of an existing profile job.
update_profile_job(Client, Name, Input) ->
    update_profile_job(Client, Name, Input, []).
update_profile_job(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/profileJobs/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Modifies the definition of an existing DataBrew project.
update_project(Client, Name, Input) ->
    update_project(Client, Name, Input, []).
update_project(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/projects/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Modifies the definition of the `LATEST_WORKING' version of a DataBrew
%% recipe.
update_recipe(Client, Name, Input) ->
    update_recipe(Client, Name, Input, []).
update_recipe(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/recipes/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Modifies the definition of an existing DataBrew recipe job.
update_recipe_job(Client, Name, Input) ->
    update_recipe_job(Client, Name, Input, []).
update_recipe_job(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/recipeJobs/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Modifies the definition of an existing DataBrew schedule.
update_schedule(Client, Name, Input) ->
    update_schedule(Client, Name, Input, []).
update_schedule(Client, Name, Input0, Options) ->
    Method = put,
    Path = ["/schedules/", aws_util:encode_uri(Name), ""],
    SuccessStatusCode = undefined,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), atom(), iolist(), list(),
              list(), map() | undefined, list(), pos_integer() | undefined) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map(),
    Error :: map().
request(Client, Method, Path, Query, Headers0, Input, Options, SuccessStatusCode) ->
    Client1 = Client#{service => <<"databrew">>},
    Host = build_host(<<"databrew">>, Client1),
    URL0 = build_url(Host, Path, Client1),
    URL = aws_request:add_query(URL0, Query),
    AdditionalHeaders = [ {<<"Host">>, Host}
                        , {<<"Content-Type">>, <<"application/x-amz-json-1.1">>}
                        ],
    Headers1 = aws_request:add_headers(AdditionalHeaders, Headers0),

    Payload =
      case proplists:get_value(should_send_body_as_binary, Options) of
        true ->
          maps:get(<<"Body">>, Input, <<"">>);
        undefined ->
          encode_payload(Input)
      end,

    MethodBin = aws_request:method_to_binary(Method),
    SignedHeaders = aws_request:sign_request(Client1, MethodBin, URL, Headers1, Payload),
    Response = hackney:request(Method, URL, SignedHeaders, Payload, Options),
    handle_response(Response, SuccessStatusCode).

handle_response({ok, StatusCode, ResponseHeaders, Client}, SuccessStatusCode)
  when StatusCode =:= 200;
       StatusCode =:= 202;
       StatusCode =:= 204;
       StatusCode =:= SuccessStatusCode ->
    case hackney:body(Client) of
        {ok, <<>>} when StatusCode =:= 200;
                        StatusCode =:= SuccessStatusCode ->
            {ok, #{}, {StatusCode, ResponseHeaders, Client}};
        {ok, Body} ->
            Result = jsx:decode(Body),
            {ok, Result, {StatusCode, ResponseHeaders, Client}}
    end;
handle_response({ok, StatusCode, ResponseHeaders, Client}, _) ->
    {ok, Body} = hackney:body(Client),
    Error = jsx:decode(Body),
    {error, Error, {StatusCode, ResponseHeaders, Client}};
handle_response({error, Reason}, _) ->
  {error, Reason}.

build_host(_EndpointPrefix, #{region := <<"local">>, endpoint := Endpoint}) ->
    Endpoint;
build_host(_EndpointPrefix, #{region := <<"local">>}) ->
    <<"localhost">>;
build_host(EndpointPrefix, #{region := Region, endpoint := Endpoint}) ->
    aws_util:binary_join([EndpointPrefix, Region, Endpoint], <<".">>).

build_url(Host, Path0, Client) ->
    Proto = maps:get(proto, Client),
    Path = erlang:iolist_to_binary(Path0),
    Port = maps:get(port, Client),
    aws_util:binary_join([Proto, <<"://">>, Host, <<":">>, Port, Path], <<"">>).

-spec encode_payload(undefined | map()) -> binary().
encode_payload(undefined) ->
  <<>>;
encode_payload(Input) ->
  jsx:encode(Input).
