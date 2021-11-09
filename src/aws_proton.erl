%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc This is the AWS Proton Service API Reference.
%%
%% It provides descriptions, syntax and usage examples for each of the
%% actions and data types for the AWS Proton service.
%%
%% The documentation for each action shows the Query API request parameters
%% and the XML response.
%%
%% Alternatively, you can use the AWS CLI to access an API. For more
%% information, see the AWS Command Line Interface User Guide.
%%
%% The AWS Proton service is a two-pronged automation framework.
%% Administrators create service templates to provide standardized
%% infrastructure and deployment tooling for serverless and container based
%% applications. Developers, in turn, select from the available service
%% templates to automate their application or service deployments.
%%
%% Because administrators define the infrastructure and tooling that AWS
%% Proton deploys and manages, they need permissions to use all of the listed
%% API operations.
%%
%% When developers select a specific infrastructure and tooling set, AWS
%% Proton deploys their applications. To monitor their applications that are
%% running on AWS Proton, developers need permissions to the service create,
%% list, update and delete API operations and the service instance list and
%% update API operations.
%%
%% To learn more about AWS Proton administration, see the AWS Proton
%% Administrator Guide.
%%
%% To learn more about deploying serverless and containerized applications on
%% AWS Proton, see the AWS Proton User Guide.
%%
%% Ensuring Idempotency
%%
%% When you make a mutating API request, the request typically returns a
%% result before the asynchronous workflows of the operation are complete.
%% Operations might also time out or encounter other server issues before
%% they're complete, even if the request already returned a result. This
%% might make it difficult to determine whether the request succeeded.
%% Moreover, you might need to retry the request multiple times to ensure
%% that the operation completes successfully. However, if the original
%% request and the subsequent retries are successful, the operation occurs
%% multiple times. This means that you might create more resources than you
%% intended.
%%
%% Idempotency ensures that an API request action completes no more than one
%% time. With an idempotent request, if the original request action completes
%% successfully, any subsequent retries complete successfully without
%% performing any further actions. However, the result might contain updated
%% information, such as the current creation status.
%%
%% The following lists of APIs are grouped according to methods that ensure
%% idempotency.
%%
%% Idempotent create APIs with a client token
%%
%% The API actions in this list support idempotency with the use of a client
%% token. The corresponding AWS CLI commands also support idempotency using a
%% client token. A client token is a unique, case-sensitive string of up to
%% 64 ASCII characters. To make an idempotent API request using one of these
%% actions, specify a client token in the request. We recommend that you
%% don't reuse the same client token for other API requests. If you don’t
%% provide a client token for these APIs, a default client token is
%% automatically provided by SDKs.
%%
%% Given a request action that has succeeded:
%%
%% If you retry the request using the same client token and the same
%% parameters, the retry succeeds without performing any further actions
%% other than returning the original resource detail data in the response.
%%
%% If you retry the request using the same client token, but one or more of
%% the parameters are different, the retry throws a `ValidationException'
%% with an `IdempotentParameterMismatch' error.
%%
%% Client tokens expire eight hours after a request is made. If you retry the
%% request with the expired token, a new resource is created.
%%
%% If the original resource is deleted and you retry the request, a new
%% resource is created.
%%
%% Idempotent create APIs with a client token:
%%
%% <ul> <li> CreateEnvironmentTemplateVersion
%%
%% </li> <li> CreateServiceTemplateVersion
%%
%% </li> <li> CreateEnvironmentAccountConnection
%%
%% </li> </ul> Idempotent create APIs
%%
%% Given a request action that has succeeded:
%%
%% If you retry the request with an API from this group, and the original
%% resource hasn't been modified, the retry succeeds without performing any
%% further actions other than returning the original resource detail data in
%% the response.
%%
%% If the original resource has been modified, the retry throws a
%% `ConflictException'.
%%
%% If you retry with different input parameters, the retry throws a
%% `ValidationException' with an `IdempotentParameterMismatch' error.
%%
%% Idempotent create APIs:
%%
%% <ul> <li> CreateEnvironmentTemplate
%%
%% </li> <li> CreateServiceTemplate
%%
%% </li> <li> CreateEnvironment
%%
%% </li> <li> CreateService
%%
%% </li> </ul> Idempotent delete APIs
%%
%% Given a request action that has succeeded:
%%
%% When you retry the request with an API from this group and the resource
%% was deleted, its metadata is returned in the response.
%%
%% If you retry and the resource doesn't exist, the response is empty.
%%
%% In both cases, the retry succeeds.
%%
%% Idempotent delete APIs:
%%
%% <ul> <li> DeleteEnvironmentTemplate
%%
%% </li> <li> DeleteEnvironmentTemplateVersion
%%
%% </li> <li> DeleteServiceTemplate
%%
%% </li> <li> DeleteServiceTemplateVersion
%%
%% </li> <li> DeleteEnvironmentAccountConnection
%%
%% </li> </ul> Asynchronous idempotent delete APIs
%%
%% Given a request action that has succeeded:
%%
%% If you retry the request with an API from this group, if the original
%% request delete operation status is `DELETE_IN_PROGRESS', the retry returns
%% the resource detail data in the response without performing any further
%% actions.
%%
%% If the original request delete operation is complete, a retry returns an
%% empty response.
%%
%% Asynchronous idempotent delete APIs:
%%
%% <ul> <li> DeleteEnvironment
%%
%% </li> <li> DeleteService
%%
%% </li> </ul>
-module(aws_proton).

-export([accept_environment_account_connection/2,
         accept_environment_account_connection/3,
         cancel_environment_deployment/2,
         cancel_environment_deployment/3,
         cancel_service_instance_deployment/2,
         cancel_service_instance_deployment/3,
         cancel_service_pipeline_deployment/2,
         cancel_service_pipeline_deployment/3,
         create_environment/2,
         create_environment/3,
         create_environment_account_connection/2,
         create_environment_account_connection/3,
         create_environment_template/2,
         create_environment_template/3,
         create_environment_template_version/2,
         create_environment_template_version/3,
         create_service/2,
         create_service/3,
         create_service_template/2,
         create_service_template/3,
         create_service_template_version/2,
         create_service_template_version/3,
         delete_environment/2,
         delete_environment/3,
         delete_environment_account_connection/2,
         delete_environment_account_connection/3,
         delete_environment_template/2,
         delete_environment_template/3,
         delete_environment_template_version/2,
         delete_environment_template_version/3,
         delete_service/2,
         delete_service/3,
         delete_service_template/2,
         delete_service_template/3,
         delete_service_template_version/2,
         delete_service_template_version/3,
         get_account_settings/2,
         get_account_settings/3,
         get_environment/2,
         get_environment/3,
         get_environment_account_connection/2,
         get_environment_account_connection/3,
         get_environment_template/2,
         get_environment_template/3,
         get_environment_template_version/2,
         get_environment_template_version/3,
         get_service/2,
         get_service/3,
         get_service_instance/2,
         get_service_instance/3,
         get_service_template/2,
         get_service_template/3,
         get_service_template_version/2,
         get_service_template_version/3,
         list_environment_account_connections/2,
         list_environment_account_connections/3,
         list_environment_template_versions/2,
         list_environment_template_versions/3,
         list_environment_templates/2,
         list_environment_templates/3,
         list_environments/2,
         list_environments/3,
         list_service_instances/2,
         list_service_instances/3,
         list_service_template_versions/2,
         list_service_template_versions/3,
         list_service_templates/2,
         list_service_templates/3,
         list_services/2,
         list_services/3,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         reject_environment_account_connection/2,
         reject_environment_account_connection/3,
         tag_resource/2,
         tag_resource/3,
         untag_resource/2,
         untag_resource/3,
         update_account_settings/2,
         update_account_settings/3,
         update_environment/2,
         update_environment/3,
         update_environment_account_connection/2,
         update_environment_account_connection/3,
         update_environment_template/2,
         update_environment_template/3,
         update_environment_template_version/2,
         update_environment_template_version/3,
         update_service/2,
         update_service/3,
         update_service_instance/2,
         update_service_instance/3,
         update_service_pipeline/2,
         update_service_pipeline/3,
         update_service_template/2,
         update_service_template/3,
         update_service_template_version/2,
         update_service_template_version/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc In a management account, an environment account connection request is
%% accepted.
%%
%% When the environment account connection request is accepted, AWS Proton
%% can use the associated IAM role to provision environment infrastructure
%% resources in the associated environment account.
%%
%% For more information, see Environment account connections in the AWS
%% Proton Administrator guide.
accept_environment_account_connection(Client, Input)
  when is_map(Client), is_map(Input) ->
    accept_environment_account_connection(Client, Input, []).
accept_environment_account_connection(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"AcceptEnvironmentAccountConnection">>, Input, Options).

%% @doc Attempts to cancel an environment deployment on an
%% `UpdateEnvironment' action, if the deployment is `IN_PROGRESS'.
%%
%% For more information, see Update an environment in the AWS Proton
%% Administrator guide.
%%
%% The following list includes potential cancellation scenarios.
%%
%% <ul> <li> If the cancellation attempt succeeds, the resulting deployment
%% state is `CANCELLED'.
%%
%% </li> <li> If the cancellation attempt fails, the resulting deployment
%% state is `FAILED'.
%%
%% </li> <li> If the current `UpdateEnvironment' action succeeds before the
%% cancellation attempt starts, the resulting deployment state is `SUCCEEDED'
%% and the cancellation attempt has no effect.
%%
%% </li> </ul>
cancel_environment_deployment(Client, Input)
  when is_map(Client), is_map(Input) ->
    cancel_environment_deployment(Client, Input, []).
cancel_environment_deployment(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CancelEnvironmentDeployment">>, Input, Options).

%% @doc Attempts to cancel a service instance deployment on an
%% `UpdateServiceInstance' action, if the deployment is `IN_PROGRESS'.
%%
%% For more information, see Update a service instance in the AWS Proton
%% Administrator guide or the AWS Proton User guide.
%%
%% The following list includes potential cancellation scenarios.
%%
%% <ul> <li> If the cancellation attempt succeeds, the resulting deployment
%% state is `CANCELLED'.
%%
%% </li> <li> If the cancellation attempt fails, the resulting deployment
%% state is `FAILED'.
%%
%% </li> <li> If the current `UpdateServiceInstance' action succeeds before
%% the cancellation attempt starts, the resulting deployment state is
%% `SUCCEEDED' and the cancellation attempt has no effect.
%%
%% </li> </ul>
cancel_service_instance_deployment(Client, Input)
  when is_map(Client), is_map(Input) ->
    cancel_service_instance_deployment(Client, Input, []).
cancel_service_instance_deployment(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CancelServiceInstanceDeployment">>, Input, Options).

%% @doc Attempts to cancel a service pipeline deployment on an
%% `UpdateServicePipeline' action, if the deployment is `IN_PROGRESS'.
%%
%% For more information, see Update a service pipeline in the AWS Proton
%% Administrator guide or the AWS Proton User guide.
%%
%% The following list includes potential cancellation scenarios.
%%
%% <ul> <li> If the cancellation attempt succeeds, the resulting deployment
%% state is `CANCELLED'.
%%
%% </li> <li> If the cancellation attempt fails, the resulting deployment
%% state is `FAILED'.
%%
%% </li> <li> If the current `UpdateServicePipeline' action succeeds before
%% the cancellation attempt starts, the resulting deployment state is
%% `SUCCEEDED' and the cancellation attempt has no effect.
%%
%% </li> </ul>
cancel_service_pipeline_deployment(Client, Input)
  when is_map(Client), is_map(Input) ->
    cancel_service_pipeline_deployment(Client, Input, []).
cancel_service_pipeline_deployment(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CancelServicePipelineDeployment">>, Input, Options).

%% @doc Deploy a new environment.
%%
%% An AWS Proton environment is created from an environment template that
%% defines infrastructure and resources that can be shared across services.
%% For more information, see the Environments in the AWS Proton Administrator
%% Guide.
create_environment(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_environment(Client, Input, []).
create_environment(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateEnvironment">>, Input, Options).

%% @doc Create an environment account connection in an environment account so
%% that environment infrastructure resources can be provisioned in the
%% environment account from a management account.
%%
%% An environment account connection is a secure bi-directional connection
%% between a management account and an environment account that maintains
%% authorization and permissions. For more information, see Environment
%% account connections in the AWS Proton Administrator guide.
create_environment_account_connection(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_environment_account_connection(Client, Input, []).
create_environment_account_connection(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateEnvironmentAccountConnection">>, Input, Options).

%% @doc Create an environment template for AWS Proton.
%%
%% For more information, see Environment Templates in the AWS Proton
%% Administrator Guide.
%%
%% You can create an environment template in one of the two following ways:
%%
%% <ul> <li> Register and publish a standard environment template that
%% instructs AWS Proton to deploy and manage environment infrastructure.
%%
%% </li> <li> Register and publish a customer managed environment template
%% that connects AWS Proton to your existing provisioned infrastructure that
%% you manage. AWS Proton doesn't manage your existing provisioned
%% infrastructure. To create an environment template for customer provisioned
%% and managed infrastructure, include the `provisioning' parameter and set
%% the value to `CUSTOMER_MANAGED'. For more information, see Register and
%% publish an environment template in the AWS Proton Administrator Guide.
%%
%% </li> </ul>
create_environment_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_environment_template(Client, Input, []).
create_environment_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateEnvironmentTemplate">>, Input, Options).

%% @doc Create a new major or minor version of an environment template.
%%
%% A major version of an environment template is a version that isn't
%% backwards compatible. A minor version of an environment template is a
%% version that's backwards compatible within its major version.
create_environment_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_environment_template_version(Client, Input, []).
create_environment_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateEnvironmentTemplateVersion">>, Input, Options).

%% @doc Create an AWS Proton service.
%%
%% An AWS Proton service is an instantiation of a service template and often
%% includes several service instances and pipeline. For more information, see
%% Services in the AWS Proton Administrator Guide and Services in the AWS
%% Proton User Guide.
create_service(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_service(Client, Input, []).
create_service(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateService">>, Input, Options).

%% @doc Create a service template.
%%
%% The administrator creates a service template to define standardized
%% infrastructure and an optional CICD service pipeline. Developers, in turn,
%% select the service template from AWS Proton. If the selected service
%% template includes a service pipeline definition, they provide a link to
%% their source code repository. AWS Proton then deploys and manages the
%% infrastructure defined by the selected service template. For more
%% information, see Service Templates in the AWS Proton Administrator Guide.
create_service_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_service_template(Client, Input, []).
create_service_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateServiceTemplate">>, Input, Options).

%% @doc Create a new major or minor version of a service template.
%%
%% A major version of a service template is a version that isn't backwards
%% compatible. A minor version of a service template is a version that's
%% backwards compatible within its major version.
create_service_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_service_template_version(Client, Input, []).
create_service_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateServiceTemplateVersion">>, Input, Options).

%% @doc Delete an environment.
delete_environment(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_environment(Client, Input, []).
delete_environment(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteEnvironment">>, Input, Options).

%% @doc In an environment account, delete an environment account connection.
%%
%% After you delete an environment account connection that’s in use by an AWS
%% Proton environment, AWS Proton can’t manage the environment infrastructure
%% resources until a new environment account connection is accepted for the
%% environment account and associated environment. You're responsible for
%% cleaning up provisioned resources that remain without an environment
%% connection.
%%
%% For more information, see Environment account connections in the AWS
%% Proton Administrator guide.
delete_environment_account_connection(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_environment_account_connection(Client, Input, []).
delete_environment_account_connection(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteEnvironmentAccountConnection">>, Input, Options).

%% @doc If no other major or minor versions of an environment template exist,
%% delete the environment template.
delete_environment_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_environment_template(Client, Input, []).
delete_environment_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteEnvironmentTemplate">>, Input, Options).

%% @doc If no other minor versions of an environment template exist, delete a
%% major version of the environment template if it's not the `Recommended'
%% version.
%%
%% Delete the `Recommended' version of the environment template if no other
%% major versions or minor versions of the environment template exist. A
%% major version of an environment template is a version that's not backwards
%% compatible.
%%
%% Delete a minor version of an environment template if it isn't the
%% `Recommended' version. Delete a `Recommended' minor version of the
%% environment template if no other minor versions of the environment
%% template exist. A minor version of an environment template is a version
%% that's backwards compatible.
delete_environment_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_environment_template_version(Client, Input, []).
delete_environment_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteEnvironmentTemplateVersion">>, Input, Options).

%% @doc Delete a service.
delete_service(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_service(Client, Input, []).
delete_service(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteService">>, Input, Options).

%% @doc If no other major or minor versions of the service template exist,
%% delete the service template.
delete_service_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_service_template(Client, Input, []).
delete_service_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteServiceTemplate">>, Input, Options).

%% @doc If no other minor versions of a service template exist, delete a
%% major version of the service template if it's not the `Recommended'
%% version.
%%
%% Delete the `Recommended' version of the service template if no other major
%% versions or minor versions of the service template exist. A major version
%% of a service template is a version that isn't backwards compatible.
%%
%% Delete a minor version of a service template if it's not the `Recommended'
%% version. Delete a `Recommended' minor version of the service template if
%% no other minor versions of the service template exist. A minor version of
%% a service template is a version that's backwards compatible.
delete_service_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_service_template_version(Client, Input, []).
delete_service_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteServiceTemplateVersion">>, Input, Options).

%% @doc Get detail data for the AWS Proton pipeline service role.
get_account_settings(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_account_settings(Client, Input, []).
get_account_settings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetAccountSettings">>, Input, Options).

%% @doc Get detail data for an environment.
get_environment(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_environment(Client, Input, []).
get_environment(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetEnvironment">>, Input, Options).

%% @doc In an environment account, view the detail data for an environment
%% account connection.
%%
%% For more information, see Environment account connections in the AWS
%% Proton Administrator guide.
get_environment_account_connection(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_environment_account_connection(Client, Input, []).
get_environment_account_connection(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetEnvironmentAccountConnection">>, Input, Options).

%% @doc Get detail data for an environment template.
get_environment_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_environment_template(Client, Input, []).
get_environment_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetEnvironmentTemplate">>, Input, Options).

%% @doc View detail data for a major or minor version of an environment
%% template.
get_environment_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_environment_template_version(Client, Input, []).
get_environment_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetEnvironmentTemplateVersion">>, Input, Options).

%% @doc Get detail data for a service.
get_service(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_service(Client, Input, []).
get_service(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetService">>, Input, Options).

%% @doc Get detail data for a service instance.
%%
%% A service instance is an instantiation of service template, which is
%% running in a specific environment.
get_service_instance(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_service_instance(Client, Input, []).
get_service_instance(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetServiceInstance">>, Input, Options).

%% @doc Get detail data for a service template.
get_service_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_service_template(Client, Input, []).
get_service_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetServiceTemplate">>, Input, Options).

%% @doc View detail data for a major or minor version of a service template.
get_service_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_service_template_version(Client, Input, []).
get_service_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetServiceTemplateVersion">>, Input, Options).

%% @doc View a list of environment account connections.
%%
%% For more information, see Environment account connections in the AWS
%% Proton Administrator guide.
list_environment_account_connections(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_environment_account_connections(Client, Input, []).
list_environment_account_connections(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListEnvironmentAccountConnections">>, Input, Options).

%% @doc List major or minor versions of an environment template with detail
%% data.
list_environment_template_versions(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_environment_template_versions(Client, Input, []).
list_environment_template_versions(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListEnvironmentTemplateVersions">>, Input, Options).

%% @doc List environment templates.
list_environment_templates(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_environment_templates(Client, Input, []).
list_environment_templates(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListEnvironmentTemplates">>, Input, Options).

%% @doc List environments with detail data summaries.
list_environments(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_environments(Client, Input, []).
list_environments(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListEnvironments">>, Input, Options).

%% @doc List service instances with summaries of detail data.
list_service_instances(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_service_instances(Client, Input, []).
list_service_instances(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListServiceInstances">>, Input, Options).

%% @doc List major or minor versions of a service template with detail data.
list_service_template_versions(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_service_template_versions(Client, Input, []).
list_service_template_versions(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListServiceTemplateVersions">>, Input, Options).

%% @doc List service templates with detail data.
list_service_templates(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_service_templates(Client, Input, []).
list_service_templates(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListServiceTemplates">>, Input, Options).

%% @doc List services with summaries of detail data.
list_services(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_services(Client, Input, []).
list_services(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListServices">>, Input, Options).

%% @doc List tags for a resource.
%%
%% For more information, see AWS Proton resources and tagging in the AWS
%% Proton Administrator Guide or AWS Proton User Guide.
list_tags_for_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_for_resource(Client, Input, []).
list_tags_for_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsForResource">>, Input, Options).

%% @doc In a management account, reject an environment account connection
%% from another environment account.
%%
%% After you reject an environment account connection request, you won’t be
%% able to accept or use the rejected environment account connection.
%%
%% You can’t reject an environment account connection that is connected to an
%% environment.
%%
%% For more information, see Environment account connections in the AWS
%% Proton Administrator guide.
reject_environment_account_connection(Client, Input)
  when is_map(Client), is_map(Input) ->
    reject_environment_account_connection(Client, Input, []).
reject_environment_account_connection(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RejectEnvironmentAccountConnection">>, Input, Options).

%% @doc Tag a resource.
%%
%% For more information, see AWS Proton resources and tagging in the AWS
%% Proton Administrator Guide or AWS Proton User Guide.
tag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    tag_resource(Client, Input, []).
tag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TagResource">>, Input, Options).

%% @doc Remove a tag from a resource.
%%
%% For more information, see AWS Proton resources and tagging in the AWS
%% Proton Administrator Guide or AWS Proton User Guide.
untag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    untag_resource(Client, Input, []).
untag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UntagResource">>, Input, Options).

%% @doc Update the AWS Proton pipeline service account settings.
update_account_settings(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_account_settings(Client, Input, []).
update_account_settings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateAccountSettings">>, Input, Options).

%% @doc Update an environment.
%%
%% If the environment is associated with an environment account connection,
%% don't update or include the `protonServiceRoleArn' parameter to update or
%% connect to an environment account connection.
%%
%% You can only update to a new environment account connection if it was
%% created in the same environment account that the current environment
%% account connection was created in and is associated with the current
%% environment.
%%
%% If the environment isn't associated with an environment account
%% connection, don't update or include the `environmentAccountConnectionId'
%% parameter to update or connect to an environment account connection.
%%
%% You can update either the `environmentAccountConnectionId' or
%% `protonServiceRoleArn' parameter and value. You can’t update both.
%%
%% There are four modes for updating an environment as described in the
%% following. The `deploymentType' field defines the mode.
%%
%% <dl> <dt> </dt><dd> `NONE'
%%
%% In this mode, a deployment doesn't occur. Only the requested metadata
%% parameters are updated.
%%
%% </dd> <dt> </dt><dd> `CURRENT_VERSION'
%%
%% In this mode, the environment is deployed and updated with the new spec
%% that you provide. Only requested parameters are updated. Don’t include
%% minor or major version parameters when you use this `deployment-type'.
%%
%% </dd> <dt> </dt><dd> `MINOR_VERSION'
%%
%% In this mode, the environment is deployed and updated with the published,
%% recommended (latest) minor version of the current major version in use, by
%% default. You can also specify a different minor version of the current
%% major version in use.
%%
%% </dd> <dt> </dt><dd> `MAJOR_VERSION'
%%
%% In this mode, the environment is deployed and updated with the published,
%% recommended (latest) major and minor version of the current template, by
%% default. You can also specify a different major version that's higher than
%% the major version in use and a minor version (optional).
%%
%% </dd> </dl>
update_environment(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_environment(Client, Input, []).
update_environment(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateEnvironment">>, Input, Options).

%% @doc In an environment account, update an environment account connection
%% to use a new IAM role.
%%
%% For more information, see Environment account connections in the AWS
%% Proton Administrator guide.
update_environment_account_connection(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_environment_account_connection(Client, Input, []).
update_environment_account_connection(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateEnvironmentAccountConnection">>, Input, Options).

%% @doc Update an environment template.
update_environment_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_environment_template(Client, Input, []).
update_environment_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateEnvironmentTemplate">>, Input, Options).

%% @doc Update a major or minor version of an environment template.
update_environment_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_environment_template_version(Client, Input, []).
update_environment_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateEnvironmentTemplateVersion">>, Input, Options).

%% @doc Edit a service description or use a spec to add and delete service
%% instances.
%%
%% Existing service instances and the service pipeline can't be edited using
%% this API. They can only be deleted.
%%
%% Use the `description' parameter to modify the description.
%%
%% Edit the `spec' parameter to add or delete instances.
update_service(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_service(Client, Input, []).
update_service(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateService">>, Input, Options).

%% @doc Update a service instance.
%%
%% There are four modes for updating a service instance as described in the
%% following. The `deploymentType' field defines the mode.
%%
%% <dl> <dt> </dt><dd> `NONE'
%%
%% In this mode, a deployment doesn't occur. Only the requested metadata
%% parameters are updated.
%%
%% </dd> <dt> </dt><dd> `CURRENT_VERSION'
%%
%% In this mode, the service instance is deployed and updated with the new
%% spec that you provide. Only requested parameters are updated. Don’t
%% include minor or major version parameters when you use this
%% `deployment-type'.
%%
%% </dd> <dt> </dt><dd> `MINOR_VERSION'
%%
%% In this mode, the service instance is deployed and updated with the
%% published, recommended (latest) minor version of the current major version
%% in use, by default. You can also specify a different minor version of the
%% current major version in use.
%%
%% </dd> <dt> </dt><dd> `MAJOR_VERSION'
%%
%% In this mode, the service instance is deployed and updated with the
%% published, recommended (latest) major and minor version of the current
%% template, by default. You can also specify a different major version that
%% is higher than the major version in use and a minor version (optional).
%%
%% </dd> </dl>
update_service_instance(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_service_instance(Client, Input, []).
update_service_instance(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateServiceInstance">>, Input, Options).

%% @doc Update the service pipeline.
%%
%% There are four modes for updating a service pipeline as described in the
%% following. The `deploymentType' field defines the mode.
%%
%% <dl> <dt> </dt><dd> `NONE'
%%
%% In this mode, a deployment doesn't occur. Only the requested metadata
%% parameters are updated.
%%
%% </dd> <dt> </dt><dd> `CURRENT_VERSION'
%%
%% In this mode, the service pipeline is deployed and updated with the new
%% spec that you provide. Only requested parameters are updated. Don’t
%% include minor or major version parameters when you use this
%% `deployment-type'.
%%
%% </dd> <dt> </dt><dd> `MINOR_VERSION'
%%
%% In this mode, the service pipeline is deployed and updated with the
%% published, recommended (latest) minor version of the current major version
%% in use, by default. You can also specify a different minor version of the
%% current major version in use.
%%
%% </dd> <dt> </dt><dd> `MAJOR_VERSION'
%%
%% In this mode, the service pipeline is deployed and updated with the
%% published, recommended (latest) major and minor version of the current
%% template by default. You can also specify a different major version that
%% is higher than the major version in use and a minor version (optional).
%%
%% </dd> </dl>
update_service_pipeline(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_service_pipeline(Client, Input, []).
update_service_pipeline(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateServicePipeline">>, Input, Options).

%% @doc Update a service template.
update_service_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_service_template(Client, Input, []).
update_service_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateServiceTemplate">>, Input, Options).

%% @doc Update a major or minor version of a service template.
update_service_template_version(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_service_template_version(Client, Input, []).
update_service_template_version(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateServiceTemplateVersion">>, Input, Options).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), binary(), map(), list()) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map() | undefined,
    Error :: map().
request(Client, Action, Input0, Options) ->
    Client1 = Client#{service => <<"proton">>},
    Host = build_host(<<"proton">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.0">>},
        {<<"X-Amz-Target">>, <<"AwsProton20200720.", Action/binary>>}
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