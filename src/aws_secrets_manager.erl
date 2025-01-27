%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc Amazon Web Services Secrets Manager
%%
%% Amazon Web Services Secrets Manager provides a service to enable you to
%% store, manage, and retrieve, secrets.
%%
%% This guide provides descriptions of the Secrets Manager API. For more
%% information about using this service, see the Amazon Web Services Secrets
%% Manager User Guide.
%%
%% API Version
%%
%% This version of the Secrets Manager API Reference documents the Secrets
%% Manager API version 2017-10-17.
%%
%% As an alternative to using the API, you can use one of the Amazon Web
%% Services SDKs, which consist of libraries and sample code for various
%% programming languages and platforms such as Java, Ruby, .NET, iOS, and
%% Android. The SDKs provide a convenient way to create programmatic access
%% to Amazon Web Services Secrets Manager. For example, the SDKs provide
%% cryptographically signing requests, managing errors, and retrying requests
%% automatically. For more information about the Amazon Web Services SDKs,
%% including downloading and installing them, see Tools for Amazon Web
%% Services.
%%
%% We recommend you use the Amazon Web Services SDKs to make programmatic API
%% calls to Secrets Manager. However, you also can use the Secrets Manager
%% HTTP Query API to make direct calls to the Secrets Manager web service. To
%% learn more about the Secrets Manager HTTP Query API, see Making Query
%% Requests in the Amazon Web Services Secrets Manager User Guide.
%%
%% Secrets Manager API supports GET and POST requests for all actions, and
%% doesn't require you to use GET for some actions and POST for others.
%% However, GET requests are subject to the limitation size of a URL.
%% Therefore, for operations that require larger sizes, use a POST request.
%%
%% Support and Feedback for Amazon Web Services Secrets Manager
%%
%% We welcome your feedback. Send your comments to
%% awssecretsmanager-feedback@amazon.com, or post your feedback and questions
%% in the Amazon Web Services Secrets Manager Discussion Forum. For more
%% information about the Amazon Web Services Discussion Forums, see Forums
%% Help.
%%
%% How examples are presented
%%
%% The JSON that Amazon Web Services Secrets Manager expects as your request
%% parameters and the service returns as a response to HTTP query requests
%% contain single, long strings without line breaks or white space
%% formatting. The JSON shown in the examples displays the code formatted
%% with both line breaks and white space to improve readability. When example
%% input parameters can also cause long strings extending beyond the screen,
%% you can insert line breaks to enhance readability. You should always
%% submit the input as a single JSON text string.
%%
%% Logging API Requests
%%
%% Amazon Web Services Secrets Manager supports Amazon Web Services
%% CloudTrail, a service that records Amazon Web Services API calls for your
%% Amazon Web Services account and delivers log files to an Amazon S3 bucket.
%% By using information that's collected by Amazon Web Services CloudTrail,
%% you can determine the requests successfully made to Secrets Manager, who
%% made the request, when it was made, and so on. For more about Amazon Web
%% Services Secrets Manager and support for Amazon Web Services CloudTrail,
%% see Logging Amazon Web Services Secrets Manager Events with Amazon Web
%% Services CloudTrail in the Amazon Web Services Secrets Manager User Guide.
%% To learn more about CloudTrail, including enabling it and find your log
%% files, see the Amazon Web Services CloudTrail User Guide.
-module(aws_secrets_manager).

-export([cancel_rotate_secret/2,
         cancel_rotate_secret/3,
         create_secret/2,
         create_secret/3,
         delete_resource_policy/2,
         delete_resource_policy/3,
         delete_secret/2,
         delete_secret/3,
         describe_secret/2,
         describe_secret/3,
         get_random_password/2,
         get_random_password/3,
         get_resource_policy/2,
         get_resource_policy/3,
         get_secret_value/2,
         get_secret_value/3,
         list_secret_version_ids/2,
         list_secret_version_ids/3,
         list_secrets/2,
         list_secrets/3,
         put_resource_policy/2,
         put_resource_policy/3,
         put_secret_value/2,
         put_secret_value/3,
         remove_regions_from_replication/2,
         remove_regions_from_replication/3,
         replicate_secret_to_regions/2,
         replicate_secret_to_regions/3,
         restore_secret/2,
         restore_secret/3,
         rotate_secret/2,
         rotate_secret/3,
         stop_replication_to_replica/2,
         stop_replication_to_replica/3,
         tag_resource/2,
         tag_resource/3,
         untag_resource/2,
         untag_resource/3,
         update_secret/2,
         update_secret/3,
         update_secret_version_stage/2,
         update_secret_version_stage/3,
         validate_resource_policy/2,
         validate_resource_policy/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Disables automatic scheduled rotation and cancels the rotation of a
%% secret if currently in progress.
%%
%% To re-enable scheduled rotation, call `RotateSecret' with
%% `AutomaticallyRotateAfterDays' set to a value greater than 0. This
%% immediately rotates your secret and then enables the automatic schedule.
%%
%% If you cancel a rotation while in progress, it can leave the
%% `VersionStage' labels in an unexpected state. Depending on the step of the
%% rotation in progress, you might need to remove the staging label
%% `AWSPENDING' from the partially created version, specified by the
%% `VersionId' response value. You should also evaluate the partially rotated
%% new version to see if it should be deleted, which you can do by removing
%% all staging labels from the new version `VersionStage' field.
%%
%% To successfully start a rotation, the staging label `AWSPENDING' must be
%% in one of the following states:
%%
%% <ul> <li> Not attached to any version at all
%%
%% </li> <li> Attached to the same version as the staging label `AWSCURRENT'
%%
%% </li> </ul> If the staging label `AWSPENDING' attached to a different
%% version than the version with `AWSCURRENT' then the attempt to rotate
%% fails.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:CancelRotateSecret
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To configure rotation for a secret or to manually trigger a
%% rotation, use `RotateSecret'.
%%
%% </li> <li> To get the rotation configuration details for a secret, use
%% `DescribeSecret'.
%%
%% </li> <li> To list all of the currently available secrets, use
%% `ListSecrets'.
%%
%% </li> <li> To list all of the versions currently associated with a secret,
%% use `ListSecretVersionIds'.
%%
%% </li> </ul>
cancel_rotate_secret(Client, Input)
  when is_map(Client), is_map(Input) ->
    cancel_rotate_secret(Client, Input, []).
cancel_rotate_secret(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CancelRotateSecret">>, Input, Options).

%% @doc Creates a new secret.
%%
%% A secret in Secrets Manager consists of both the protected secret data and
%% the important information needed to manage the secret.
%%
%% Secrets Manager stores the encrypted secret data in one of a collection of
%% "versions" associated with the secret. Each version contains a copy of the
%% encrypted secret data. Each version is associated with one or more
%% "staging labels" that identify where the version is in the rotation cycle.
%% The `SecretVersionsToStages' field of the secret contains the mapping of
%% staging labels to the active versions of the secret. Versions without a
%% staging label are considered deprecated and not included in the list.
%%
%% You provide the secret data to be encrypted by putting text in either the
%% `SecretString' parameter or binary data in the `SecretBinary' parameter,
%% but not both. If you include `SecretString' or `SecretBinary' then Secrets
%% Manager also creates an initial secret version and automatically attaches
%% the staging label `AWSCURRENT' to the new version.
%%
%% If you call an operation to encrypt or decrypt the `SecretString' or
%% `SecretBinary' for a secret in the same account as the calling user and
%% that secret doesn't specify a Amazon Web Services KMS encryption key,
%% Secrets Manager uses the account's default Amazon Web Services managed
%% customer master key (CMK) with the alias `aws/secretsmanager'. If this key
%% doesn't already exist in your account then Secrets Manager creates it for
%% you automatically. All users and roles in the same Amazon Web Services
%% account automatically have access to use the default CMK. Note that if an
%% Secrets Manager API call results in Amazon Web Services creating the
%% account's Amazon Web Services-managed CMK, it can result in a one-time
%% significant delay in returning the result.
%%
%% If the secret resides in a different Amazon Web Services account from the
%% credentials calling an API that requires encryption or decryption of the
%% secret value then you must create and use a custom Amazon Web Services KMS
%% CMK because you can't access the default CMK for the account using
%% credentials from a different Amazon Web Services account. Store the ARN of
%% the CMK in the secret when you create the secret or when you update it by
%% including it in the `KMSKeyId'. If you call an API that must encrypt or
%% decrypt `SecretString' or `SecretBinary' using credentials from a
%% different account then the Amazon Web Services KMS key policy must grant
%% cross-account access to that other account's user or role for both the
%% kms:GenerateDataKey and kms:Decrypt operations.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:CreateSecret
%%
%% </li> <li> kms:GenerateDataKey - needed only if you use a customer-managed
%% Amazon Web Services KMS key to encrypt the secret. You do not need this
%% permission to use the account default Amazon Web Services managed CMK for
%% Secrets Manager.
%%
%% </li> <li> kms:Decrypt - needed only if you use a customer-managed Amazon
%% Web Services KMS key to encrypt the secret. You do not need this
%% permission to use the account default Amazon Web Services managed CMK for
%% Secrets Manager.
%%
%% </li> <li> secretsmanager:TagResource - needed only if you include the
%% `Tags' parameter.
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To delete a secret, use `DeleteSecret'.
%%
%% </li> <li> To modify an existing secret, use `UpdateSecret'.
%%
%% </li> <li> To create a new version of a secret, use `PutSecretValue'.
%%
%% </li> <li> To retrieve the encrypted secure string and secure binary
%% values, use `GetSecretValue'.
%%
%% </li> <li> To retrieve all other details for a secret, use
%% `DescribeSecret'. This does not include the encrypted secure string and
%% secure binary values.
%%
%% </li> <li> To retrieve the list of secret versions associated with the
%% current secret, use `DescribeSecret' and examine the
%% `SecretVersionsToStages' response value.
%%
%% </li> </ul>
create_secret(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_secret(Client, Input, []).
create_secret(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateSecret">>, Input, Options).

%% @doc Deletes the resource-based permission policy attached to the secret.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:DeleteResourcePolicy
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To attach a resource policy to a secret, use
%% `PutResourcePolicy'.
%%
%% </li> <li> To retrieve the current resource-based policy attached to a
%% secret, use `GetResourcePolicy'.
%%
%% </li> <li> To list all of the currently available secrets, use
%% `ListSecrets'.
%%
%% </li> </ul>
delete_resource_policy(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_resource_policy(Client, Input, []).
delete_resource_policy(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteResourcePolicy">>, Input, Options).

%% @doc Deletes an entire secret and all of the versions.
%%
%% You can optionally include a recovery window during which you can restore
%% the secret. If you don't specify a recovery window value, the operation
%% defaults to 30 days. Secrets Manager attaches a `DeletionDate' stamp to
%% the secret that specifies the end of the recovery window. At the end of
%% the recovery window, Secrets Manager deletes the secret permanently.
%%
%% At any time before recovery window ends, you can use `RestoreSecret' to
%% remove the `DeletionDate' and cancel the deletion of the secret.
%%
%% You cannot access the encrypted secret information in any secret scheduled
%% for deletion. If you need to access that information, you must cancel the
%% deletion with `RestoreSecret' and then retrieve the information.
%%
%% There is no explicit operation to delete a version of a secret. Instead,
%% remove all staging labels from the `VersionStage' field of a version. That
%% marks the version as deprecated and allows Secrets Manager to delete it as
%% needed. Versions without any staging labels do not show up in
%% `ListSecretVersionIds' unless you specify `IncludeDeprecated'.
%%
%% The permanent secret deletion at the end of the waiting period is
%% performed as a background task with low priority. There is no guarantee of
%% a specific time after the recovery window for the actual delete operation
%% to occur.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:DeleteSecret
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To create a secret, use `CreateSecret'.
%%
%% </li> <li> To cancel deletion of a version of a secret before the recovery
%% window has expired, use `RestoreSecret'.
%%
%% </li> </ul>
delete_secret(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_secret(Client, Input, []).
delete_secret(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteSecret">>, Input, Options).

%% @doc Retrieves the details of a secret.
%%
%% It does not include the encrypted fields. Secrets Manager only returns
%% fields populated with a value in the response.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:DescribeSecret
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To create a secret, use `CreateSecret'.
%%
%% </li> <li> To modify a secret, use `UpdateSecret'.
%%
%% </li> <li> To retrieve the encrypted secret information in a version of
%% the secret, use `GetSecretValue'.
%%
%% </li> <li> To list all of the secrets in the Amazon Web Services account,
%% use `ListSecrets'.
%%
%% </li> </ul>
describe_secret(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_secret(Client, Input, []).
describe_secret(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeSecret">>, Input, Options).

%% @doc Generates a random password of the specified complexity.
%%
%% This operation is intended for use in the Lambda rotation function. Per
%% best practice, we recommend that you specify the maximum length and
%% include every character type that the system you are generating a password
%% for can support.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:GetRandomPassword
%%
%% </li> </ul>
get_random_password(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_random_password(Client, Input, []).
get_random_password(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetRandomPassword">>, Input, Options).

%% @doc Retrieves the JSON text of the resource-based policy document
%% attached to the specified secret.
%%
%% The JSON request string input and response output displays formatted code
%% with white space and line breaks for better readability. Submit your input
%% as a single line JSON string.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:GetResourcePolicy
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To attach a resource policy to a secret, use
%% `PutResourcePolicy'.
%%
%% </li> <li> To delete the resource-based policy attached to a secret, use
%% `DeleteResourcePolicy'.
%%
%% </li> <li> To list all of the currently available secrets, use
%% `ListSecrets'.
%%
%% </li> </ul>
get_resource_policy(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_resource_policy(Client, Input, []).
get_resource_policy(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetResourcePolicy">>, Input, Options).

%% @doc Retrieves the contents of the encrypted fields `SecretString' or
%% `SecretBinary' from the specified version of a secret, whichever contains
%% content.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:GetSecretValue
%%
%% </li> <li> kms:Decrypt - required only if you use a customer-managed
%% Amazon Web Services KMS key to encrypt the secret. You do not need this
%% permission to use the account's default Amazon Web Services managed CMK
%% for Secrets Manager.
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To create a new version of the secret with different encrypted
%% information, use `PutSecretValue'.
%%
%% </li> <li> To retrieve the non-encrypted details for the secret, use
%% `DescribeSecret'.
%%
%% </li> </ul>
get_secret_value(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_secret_value(Client, Input, []).
get_secret_value(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetSecretValue">>, Input, Options).

%% @doc Lists all of the versions attached to the specified secret.
%%
%% The output does not include the `SecretString' or `SecretBinary' fields.
%% By default, the list includes only versions that have at least one staging
%% label in `VersionStage' attached.
%%
%% Always check the `NextToken' response parameter when calling any of the
%% `List*' operations. These operations can occasionally return an empty or
%% shorter than expected list of results even when there more results become
%% available. When this happens, the `NextToken' response parameter contains
%% a value to pass to the next call to the same API to request the next part
%% of the list.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:ListSecretVersionIds
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To list the secrets in an account, use `ListSecrets'.
%%
%% </li> </ul>
list_secret_version_ids(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_secret_version_ids(Client, Input, []).
list_secret_version_ids(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListSecretVersionIds">>, Input, Options).

%% @doc Lists all of the secrets that are stored by Secrets Manager in the
%% Amazon Web Services account.
%%
%% To list the versions currently stored for a specific secret, use
%% `ListSecretVersionIds'. The encrypted fields `SecretString' and
%% `SecretBinary' are not included in the output. To get that information,
%% call the `GetSecretValue' operation.
%%
%% Always check the `NextToken' response parameter when calling any of the
%% `List*' operations. These operations can occasionally return an empty or
%% shorter than expected list of results even when there more results become
%% available. When this happens, the `NextToken' response parameter contains
%% a value to pass to the next call to the same API to request the next part
%% of the list.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:ListSecrets
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To list the versions attached to a secret, use
%% `ListSecretVersionIds'.
%%
%% </li> </ul>
list_secrets(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_secrets(Client, Input, []).
list_secrets(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListSecrets">>, Input, Options).

%% @doc Attaches the contents of the specified resource-based permission
%% policy to a secret.
%%
%% A resource-based policy is optional. Alternatively, you can use IAM
%% identity-based policies that specify the secret's Amazon Resource Name
%% (ARN) in the policy statement's `Resources' element. You can also use a
%% combination of both identity-based and resource-based policies. The
%% affected users and roles receive the permissions that are permitted by all
%% of the relevant policies. For more information, see Using Resource-Based
%% Policies for Amazon Web Services Secrets Manager. For the complete
%% description of the Amazon Web Services policy syntax and grammar, see IAM
%% JSON Policy Reference in the IAM User Guide.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:PutResourcePolicy
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To retrieve the resource policy attached to a secret, use
%% `GetResourcePolicy'.
%%
%% </li> <li> To delete the resource-based policy attached to a secret, use
%% `DeleteResourcePolicy'.
%%
%% </li> <li> To list all of the currently available secrets, use
%% `ListSecrets'.
%%
%% </li> </ul>
put_resource_policy(Client, Input)
  when is_map(Client), is_map(Input) ->
    put_resource_policy(Client, Input, []).
put_resource_policy(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"PutResourcePolicy">>, Input, Options).

%% @doc Stores a new encrypted secret value in the specified secret.
%%
%% To do this, the operation creates a new version and attaches it to the
%% secret. The version can contain a new `SecretString' value or a new
%% `SecretBinary' value. You can also specify the staging labels that are
%% initially attached to the new version.
%%
%% We recommend you avoid calling `PutSecretValue' at a sustained rate of
%% more than once every 10 minutes. When you update the secret value, Secrets
%% Manager creates a new version of the secret. Secrets Manager removes
%% outdated versions when there are more than 100, but it does not remove
%% versions created less than 24 hours ago. If you call `PutSecretValue' more
%% than once every 10 minutes, you create more versions than Secrets Manager
%% removes, and you will reach the quota for secret versions.
%%
%% <ul> <li> If this operation creates the first version for the secret then
%% Secrets Manager automatically attaches the staging label `AWSCURRENT' to
%% the new version.
%%
%% </li> <li> If you do not specify a value for VersionStages then Secrets
%% Manager automatically moves the staging label `AWSCURRENT' to this new
%% version.
%%
%% </li> <li> If this operation moves the staging label `AWSCURRENT' from
%% another version to this version, then Secrets Manager also automatically
%% moves the staging label `AWSPREVIOUS' to the version that `AWSCURRENT' was
%% removed from.
%%
%% </li> <li> This operation is idempotent. If a version with a `VersionId'
%% with the same value as the `ClientRequestToken' parameter already exists
%% and you specify the same secret data, the operation succeeds but does
%% nothing. However, if the secret data is different, then the operation
%% fails because you cannot modify an existing version; you can only create
%% new ones.
%%
%% </li> </ul> If you call an operation to encrypt or decrypt the
%% `SecretString' or `SecretBinary' for a secret in the same account as the
%% calling user and that secret doesn't specify a Amazon Web Services KMS
%% encryption key, Secrets Manager uses the account's default Amazon Web
%% Services managed customer master key (CMK) with the alias
%% `aws/secretsmanager'. If this key doesn't already exist in your account
%% then Secrets Manager creates it for you automatically. All users and roles
%% in the same Amazon Web Services account automatically have access to use
%% the default CMK. Note that if an Secrets Manager API call results in
%% Amazon Web Services creating the account's Amazon Web Services-managed
%% CMK, it can result in a one-time significant delay in returning the
%% result.
%%
%% If the secret resides in a different Amazon Web Services account from the
%% credentials calling an API that requires encryption or decryption of the
%% secret value then you must create and use a custom Amazon Web Services KMS
%% CMK because you can't access the default CMK for the account using
%% credentials from a different Amazon Web Services account. Store the ARN of
%% the CMK in the secret when you create the secret or when you update it by
%% including it in the `KMSKeyId'. If you call an API that must encrypt or
%% decrypt `SecretString' or `SecretBinary' using credentials from a
%% different account then the Amazon Web Services KMS key policy must grant
%% cross-account access to that other account's user or role for both the
%% kms:GenerateDataKey and kms:Decrypt operations.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:PutSecretValue
%%
%% </li> <li> kms:GenerateDataKey - needed only if you use a customer-managed
%% Amazon Web Services KMS key to encrypt the secret. You do not need this
%% permission to use the account's default Amazon Web Services managed CMK
%% for Secrets Manager.
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To retrieve the encrypted value you store in the version of a
%% secret, use `GetSecretValue'.
%%
%% </li> <li> To create a secret, use `CreateSecret'.
%%
%% </li> <li> To get the details for a secret, use `DescribeSecret'.
%%
%% </li> <li> To list the versions attached to a secret, use
%% `ListSecretVersionIds'.
%%
%% </li> </ul>
put_secret_value(Client, Input)
  when is_map(Client), is_map(Input) ->
    put_secret_value(Client, Input, []).
put_secret_value(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"PutSecretValue">>, Input, Options).

%% @doc Remove regions from replication.
remove_regions_from_replication(Client, Input)
  when is_map(Client), is_map(Input) ->
    remove_regions_from_replication(Client, Input, []).
remove_regions_from_replication(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RemoveRegionsFromReplication">>, Input, Options).

%% @doc Converts an existing secret to a multi-Region secret and begins
%% replication the secret to a list of new regions.
replicate_secret_to_regions(Client, Input)
  when is_map(Client), is_map(Input) ->
    replicate_secret_to_regions(Client, Input, []).
replicate_secret_to_regions(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ReplicateSecretToRegions">>, Input, Options).

%% @doc Cancels the scheduled deletion of a secret by removing the
%% `DeletedDate' time stamp.
%%
%% This makes the secret accessible to query once again.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:RestoreSecret
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To delete a secret, use `DeleteSecret'.
%%
%% </li> </ul>
restore_secret(Client, Input)
  when is_map(Client), is_map(Input) ->
    restore_secret(Client, Input, []).
restore_secret(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RestoreSecret">>, Input, Options).

%% @doc Configures and starts the asynchronous process of rotating this
%% secret.
%%
%% If you include the configuration parameters, the operation sets those
%% values for the secret and then immediately starts a rotation. If you do
%% not include the configuration parameters, the operation starts a rotation
%% with the values already stored in the secret. After the rotation
%% completes, the protected service and its clients all use the new version
%% of the secret.
%%
%% This required configuration information includes the ARN of an Amazon Web
%% Services Lambda function and optionally, the time between scheduled
%% rotations. The Lambda rotation function creates a new version of the
%% secret and creates or updates the credentials on the protected service to
%% match. After testing the new credentials, the function marks the new
%% secret with the staging label `AWSCURRENT' so that your clients all
%% immediately begin to use the new version. For more information about
%% rotating secrets and how to configure a Lambda function to rotate the
%% secrets for your protected service, see Rotating Secrets in Amazon Web
%% Services Secrets Manager in the Amazon Web Services Secrets Manager User
%% Guide.
%%
%% Secrets Manager schedules the next rotation when the previous one
%% completes. Secrets Manager schedules the date by adding the rotation
%% interval (number of days) to the actual date of the last rotation. The
%% service chooses the hour within that 24-hour date window randomly. The
%% minute is also chosen somewhat randomly, but weighted towards the top of
%% the hour and influenced by a variety of factors that help distribute load.
%%
%% The rotation function must end with the versions of the secret in one of
%% two states:
%%
%% <ul> <li> The `AWSPENDING' and `AWSCURRENT' staging labels are attached to
%% the same version of the secret, or
%%
%% </li> <li> The `AWSPENDING' staging label is not attached to any version
%% of the secret.
%%
%% </li> </ul> If the `AWSPENDING' staging label is present but not attached
%% to the same version as `AWSCURRENT' then any later invocation of
%% `RotateSecret' assumes that a previous rotation request is still in
%% progress and returns an error.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:RotateSecret
%%
%% </li> <li> lambda:InvokeFunction (on the function specified in the
%% secret's metadata)
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To list the secrets in your account, use `ListSecrets'.
%%
%% </li> <li> To get the details for a version of a secret, use
%% `DescribeSecret'.
%%
%% </li> <li> To create a new version of a secret, use `CreateSecret'.
%%
%% </li> <li> To attach staging labels to or remove staging labels from a
%% version of a secret, use `UpdateSecretVersionStage'.
%%
%% </li> </ul>
rotate_secret(Client, Input)
  when is_map(Client), is_map(Input) ->
    rotate_secret(Client, Input, []).
rotate_secret(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RotateSecret">>, Input, Options).

%% @doc Removes the secret from replication and promotes the secret to a
%% regional secret in the replica Region.
stop_replication_to_replica(Client, Input)
  when is_map(Client), is_map(Input) ->
    stop_replication_to_replica(Client, Input, []).
stop_replication_to_replica(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"StopReplicationToReplica">>, Input, Options).

%% @doc Attaches one or more tags, each consisting of a key name and a value,
%% to the specified secret.
%%
%% Tags are part of the secret's overall metadata, and are not associated
%% with any specific version of the secret. This operation only appends tags
%% to the existing list of tags. To remove tags, you must use
%% `UntagResource'.
%%
%% The following basic restrictions apply to tags:
%%
%% <ul> <li> Maximum number of tags per secret—50
%%
%% </li> <li> Maximum key length—127 Unicode characters in UTF-8
%%
%% </li> <li> Maximum value length—255 Unicode characters in UTF-8
%%
%% </li> <li> Tag keys and values are case sensitive.
%%
%% </li> <li> Do not use the `aws:' prefix in your tag names or values
%% because Amazon Web Services reserves it for Amazon Web Services use. You
%% can't edit or delete tag names or values with this prefix. Tags with this
%% prefix do not count against your tags per secret limit.
%%
%% </li> <li> If you use your tagging schema across multiple services and
%% resources, remember other services might have restrictions on allowed
%% characters. Generally allowed characters: letters, spaces, and numbers
%% representable in UTF-8, plus the following special characters: + - = . _ :
%% / @.
%%
%% </li> </ul> If you use tags as part of your security strategy, then adding
%% or removing a tag can change permissions. If successfully completing this
%% operation would result in you losing your permissions for this secret,
%% then the operation is blocked and returns an Access Denied error.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:TagResource
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To remove one or more tags from the collection attached to a
%% secret, use `UntagResource'.
%%
%% </li> <li> To view the list of tags attached to a secret, use
%% `DescribeSecret'.
%%
%% </li> </ul>
tag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    tag_resource(Client, Input, []).
tag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TagResource">>, Input, Options).

%% @doc Removes one or more tags from the specified secret.
%%
%% This operation is idempotent. If a requested tag is not attached to the
%% secret, no error is returned and the secret metadata is unchanged.
%%
%% If you use tags as part of your security strategy, then removing a tag can
%% change permissions. If successfully completing this operation would result
%% in you losing your permissions for this secret, then the operation is
%% blocked and returns an Access Denied error.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:UntagResource
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To add one or more tags to the collection attached to a secret,
%% use `TagResource'.
%%
%% </li> <li> To view the list of tags attached to a secret, use
%% `DescribeSecret'.
%%
%% </li> </ul>
untag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    untag_resource(Client, Input, []).
untag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UntagResource">>, Input, Options).

%% @doc Modifies many of the details of the specified secret.
%%
%% To change the secret value, you can also use `PutSecretValue'.
%%
%% To change the rotation configuration of a secret, use `RotateSecret'
%% instead.
%%
%% We recommend you avoid calling `UpdateSecret' at a sustained rate of more
%% than once every 10 minutes. When you call `UpdateSecret' to update the
%% secret value, Secrets Manager creates a new version of the secret. Secrets
%% Manager removes outdated versions when there are more than 100, but it
%% does not remove versions created less than 24 hours ago. If you update the
%% secret value more than once every 10 minutes, you create more versions
%% than Secrets Manager removes, and you will reach the quota for secret
%% versions.
%%
%% The Secrets Manager console uses only the `SecretString' parameter and
%% therefore limits you to encrypting and storing only a text string. To
%% encrypt and store binary data as part of the version of a secret, you must
%% use either the Amazon Web Services CLI or one of the Amazon Web Services
%% SDKs.
%%
%% <ul> <li> If a version with a `VersionId' with the same value as the
%% `ClientRequestToken' parameter already exists, the operation results in an
%% error. You cannot modify an existing version, you can only create a new
%% version.
%%
%% </li> <li> If you include `SecretString' or `SecretBinary' to create a new
%% secret version, Secrets Manager automatically attaches the staging label
%% `AWSCURRENT' to the new version.
%%
%% </li> </ul> If you call an operation to encrypt or decrypt the
%% `SecretString' or `SecretBinary' for a secret in the same account as the
%% calling user and that secret doesn't specify a Amazon Web Services KMS
%% encryption key, Secrets Manager uses the account's default Amazon Web
%% Services managed customer master key (CMK) with the alias
%% `aws/secretsmanager'. If this key doesn't already exist in your account
%% then Secrets Manager creates it for you automatically. All users and roles
%% in the same Amazon Web Services account automatically have access to use
%% the default CMK. Note that if an Secrets Manager API call results in
%% Amazon Web Services creating the account's Amazon Web Services-managed
%% CMK, it can result in a one-time significant delay in returning the
%% result.
%%
%% If the secret resides in a different Amazon Web Services account from the
%% credentials calling an API that requires encryption or decryption of the
%% secret value then you must create and use a custom Amazon Web Services KMS
%% CMK because you can't access the default CMK for the account using
%% credentials from a different Amazon Web Services account. Store the ARN of
%% the CMK in the secret when you create the secret or when you update it by
%% including it in the `KMSKeyId'. If you call an API that must encrypt or
%% decrypt `SecretString' or `SecretBinary' using credentials from a
%% different account then the Amazon Web Services KMS key policy must grant
%% cross-account access to that other account's user or role for both the
%% kms:GenerateDataKey and kms:Decrypt operations.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:UpdateSecret
%%
%% </li> <li> kms:GenerateDataKey - needed only if you use a custom Amazon
%% Web Services KMS key to encrypt the secret. You do not need this
%% permission to use the account's Amazon Web Services managed CMK for
%% Secrets Manager.
%%
%% </li> <li> kms:Decrypt - needed only if you use a custom Amazon Web
%% Services KMS key to encrypt the secret. You do not need this permission to
%% use the account's Amazon Web Services managed CMK for Secrets Manager.
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To create a new secret, use `CreateSecret'.
%%
%% </li> <li> To add only a new version to an existing secret, use
%% `PutSecretValue'.
%%
%% </li> <li> To get the details for a secret, use `DescribeSecret'.
%%
%% </li> <li> To list the versions contained in a secret, use
%% `ListSecretVersionIds'.
%%
%% </li> </ul>
update_secret(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_secret(Client, Input, []).
update_secret(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateSecret">>, Input, Options).

%% @doc Modifies the staging labels attached to a version of a secret.
%%
%% Staging labels are used to track a version as it progresses through the
%% secret rotation process. You can attach a staging label to only one
%% version of a secret at a time. If a staging label to be added is already
%% attached to another version, then it is moved--removed from the other
%% version first and then attached to this one. For more information about
%% staging labels, see Staging Labels in the Amazon Web Services Secrets
%% Manager User Guide.
%%
%% The staging labels that you specify in the `VersionStage' parameter are
%% added to the existing list of staging labels--they don't replace it.
%%
%% You can move the `AWSCURRENT' staging label to this version by including
%% it in this call.
%%
%% Whenever you move `AWSCURRENT', Secrets Manager automatically moves the
%% label `AWSPREVIOUS' to the version that `AWSCURRENT' was removed from.
%%
%% If this action results in the last label being removed from a version,
%% then the version is considered to be 'deprecated' and can be deleted by
%% Secrets Manager.
%%
%% Minimum permissions
%%
%% To run this command, you must have the following permissions:
%%
%% <ul> <li> secretsmanager:UpdateSecretVersionStage
%%
%% </li> </ul> Related operations
%%
%% <ul> <li> To get the list of staging labels that are currently associated
%% with a version of a secret, use ` `DescribeSecret' ' and examine the
%% `SecretVersionsToStages' response value.
%%
%% </li> </ul>
update_secret_version_stage(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_secret_version_stage(Client, Input, []).
update_secret_version_stage(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateSecretVersionStage">>, Input, Options).

%% @doc Validates that the resource policy does not grant a wide range of IAM
%% principals access to your secret.
%%
%% The JSON request string input and response output displays formatted code
%% with white space and line breaks for better readability. Submit your input
%% as a single line JSON string. A resource-based policy is optional for
%% secrets.
%%
%% The API performs three checks when validating the secret:
%%
%% <ul> <li> Sends a call to Zelkova, an automated reasoning engine, to
%% ensure your Resource Policy does not allow broad access to your secret.
%%
%% </li> <li> Checks for correct syntax in a policy.
%%
%% </li> <li> Verifies the policy does not lock out a caller.
%%
%% </li> </ul> Minimum Permissions
%%
%% You must have the permissions required to access the following APIs:
%%
%% <ul> <li> `secretsmanager:PutResourcePolicy'
%%
%% </li> <li> `secretsmanager:ValidateResourcePolicy'
%%
%% </li> </ul>
validate_resource_policy(Client, Input)
  when is_map(Client), is_map(Input) ->
    validate_resource_policy(Client, Input, []).
validate_resource_policy(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ValidateResourcePolicy">>, Input, Options).

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
    Client1 = Client#{service => <<"secretsmanager">>},
    Host = build_host(<<"secretsmanager">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.1">>},
        {<<"X-Amz-Target">>, <<"secretsmanager.", Action/binary>>}
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
