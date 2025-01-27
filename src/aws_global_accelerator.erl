%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc AWS Global Accelerator
%%
%% This is the AWS Global Accelerator API Reference.
%%
%% This guide is for developers who need detailed information about AWS
%% Global Accelerator API actions, data types, and errors. For more
%% information about Global Accelerator features, see the AWS Global
%% Accelerator Developer Guide.
%%
%% AWS Global Accelerator is a service in which you create accelerators to
%% improve the performance of your applications for local and global users.
%% Depending on the type of accelerator you choose, you can gain additional
%% benefits.
%%
%% <ul> <li> By using a standard accelerator, you can improve availability of
%% your internet applications that are used by a global audience. With a
%% standard accelerator, Global Accelerator directs traffic to optimal
%% endpoints over the AWS global network.
%%
%% </li> <li> For other scenarios, you might choose a custom routing
%% accelerator. With a custom routing accelerator, you can use application
%% logic to directly map one or more users to a specific endpoint among many
%% endpoints.
%%
%% </li> </ul> Global Accelerator is a global service that supports endpoints
%% in multiple AWS Regions but you must specify the US West (Oregon) Region
%% to create or update accelerators.
%%
%% By default, Global Accelerator provides you with two static IP addresses
%% that you associate with your accelerator. With a standard accelerator,
%% instead of using the IP addresses that Global Accelerator provides, you
%% can configure these entry points to be IPv4 addresses from your own IP
%% address ranges that you bring to Global Accelerator. The static IP
%% addresses are anycast from the AWS edge network. For a standard
%% accelerator, they distribute incoming application traffic across multiple
%% endpoint resources in multiple AWS Regions, which increases the
%% availability of your applications. Endpoints for standard accelerators can
%% be Network Load Balancers, Application Load Balancers, Amazon EC2
%% instances, or Elastic IP addresses that are located in one AWS Region or
%% multiple Regions. For custom routing accelerators, you map traffic that
%% arrives to the static IP addresses to specific Amazon EC2 servers in
%% endpoints that are virtual private cloud (VPC) subnets.
%%
%% The static IP addresses remain assigned to your accelerator for as long as
%% it exists, even if you disable the accelerator and it no longer accepts or
%% routes traffic. However, when you delete an accelerator, you lose the
%% static IP addresses that are assigned to it, so you can no longer route
%% traffic by using them. You can use IAM policies like tag-based permissions
%% with Global Accelerator to limit the users who have permissions to delete
%% an accelerator. For more information, see Tag-based policies.
%%
%% For standard accelerators, Global Accelerator uses the AWS global network
%% to route traffic to the optimal regional endpoint based on health, client
%% location, and policies that you configure. The service reacts instantly to
%% changes in health or configuration to ensure that internet traffic from
%% clients is always directed to healthy endpoints.
%%
%% For a list of the AWS Regions where Global Accelerator and other services
%% are currently supported, see the AWS Region Table.
%%
%% AWS Global Accelerator includes the following components:
%%
%% <dl> <dt>Static IP addresses</dt> <dd> Global Accelerator provides you
%% with a set of two static IP addresses that are anycast from the AWS edge
%% network. If you bring your own IP address range to AWS (BYOIP) to use with
%% a standard accelerator, you can instead assign IP addresses from your own
%% pool to use with your accelerator. For more information, see Bring your
%% own IP addresses (BYOIP) in AWS Global Accelerator.
%%
%% The IP addresses serve as single fixed entry points for your clients. If
%% you already have Elastic Load Balancing load balancers, Amazon EC2
%% instances, or Elastic IP address resources set up for your applications,
%% you can easily add those to a standard accelerator in Global Accelerator.
%% This allows Global Accelerator to use static IP addresses to access the
%% resources.
%%
%% The static IP addresses remain assigned to your accelerator for as long as
%% it exists, even if you disable the accelerator and it no longer accepts or
%% routes traffic. However, when you delete an accelerator, you lose the
%% static IP addresses that are assigned to it, so you can no longer route
%% traffic by using them. You can use IAM policies like tag-based permissions
%% with Global Accelerator to delete an accelerator. For more information,
%% see Tag-based policies.
%%
%% </dd> <dt>Accelerator</dt> <dd> An accelerator directs traffic to
%% endpoints over the AWS global network to improve the performance of your
%% internet applications. Each accelerator includes one or more listeners.
%%
%% There are two types of accelerators:
%%
%% <ul> <li> A standard accelerator directs traffic to the optimal AWS
%% endpoint based on several factors, including the user’s location, the
%% health of the endpoint, and the endpoint weights that you configure. This
%% improves the availability and performance of your applications. Endpoints
%% can be Network Load Balancers, Application Load Balancers, Amazon EC2
%% instances, or Elastic IP addresses.
%%
%% </li> <li> A custom routing accelerator directs traffic to one of possibly
%% thousands of Amazon EC2 instances running in a single or multiple virtual
%% private clouds (VPCs). With custom routing, listener ports are mapped to
%% statically associate port ranges with VPC subnets, which allows Global
%% Accelerator to determine an EC2 instance IP address at the time of
%% connection. By default, all port mapping destinations in a VPC subnet
%% can't receive traffic. You can choose to configure all destinations in the
%% subnet to receive traffic, or to specify individual port mappings that can
%% receive traffic.
%%
%% </li> </ul> For more information, see Types of accelerators.
%%
%% </dd> <dt>DNS name</dt> <dd> Global Accelerator assigns each accelerator a
%% default Domain Name System (DNS) name, similar to
%% `a1234567890abcdef.awsglobalaccelerator.com', that points to the static IP
%% addresses that Global Accelerator assigns to you or that you choose from
%% your own IP address range. Depending on the use case, you can use your
%% accelerator's static IP addresses or DNS name to route traffic to your
%% accelerator, or set up DNS records to route traffic using your own custom
%% domain name.
%%
%% </dd> <dt>Network zone</dt> <dd> A network zone services the static IP
%% addresses for your accelerator from a unique IP subnet. Similar to an AWS
%% Availability Zone, a network zone is an isolated unit with its own set of
%% physical infrastructure. When you configure an accelerator, by default,
%% Global Accelerator allocates two IPv4 addresses for it. If one IP address
%% from a network zone becomes unavailable due to IP address blocking by
%% certain client networks, or network disruptions, then client applications
%% can retry on the healthy static IP address from the other isolated network
%% zone.
%%
%% </dd> <dt>Listener</dt> <dd> A listener processes inbound connections from
%% clients to Global Accelerator, based on the port (or port range) and
%% protocol (or protocols) that you configure. A listener can be configured
%% for TCP, UDP, or both TCP and UDP protocols. Each listener has one or more
%% endpoint groups associated with it, and traffic is forwarded to endpoints
%% in one of the groups. You associate endpoint groups with listeners by
%% specifying the Regions that you want to distribute traffic to. With a
%% standard accelerator, traffic is distributed to optimal endpoints within
%% the endpoint groups associated with a listener.
%%
%% </dd> <dt>Endpoint group</dt> <dd> Each endpoint group is associated with
%% a specific AWS Region. Endpoint groups include one or more endpoints in
%% the Region. With a standard accelerator, you can increase or reduce the
%% percentage of traffic that would be otherwise directed to an endpoint
%% group by adjusting a setting called a traffic dial. The traffic dial lets
%% you easily do performance testing or blue/green deployment testing, for
%% example, for new releases across different AWS Regions.
%%
%% </dd> <dt>Endpoint</dt> <dd> An endpoint is a resource that Global
%% Accelerator directs traffic to.
%%
%% Endpoints for standard accelerators can be Network Load Balancers,
%% Application Load Balancers, Amazon EC2 instances, or Elastic IP addresses.
%% An Application Load Balancer endpoint can be internet-facing or internal.
%% Traffic for standard accelerators is routed to endpoints based on the
%% health of the endpoint along with configuration options that you choose,
%% such as endpoint weights. For each endpoint, you can configure weights,
%% which are numbers that you can use to specify the proportion of traffic to
%% route to each one. This can be useful, for example, to do performance
%% testing within a Region.
%%
%% Endpoints for custom routing accelerators are virtual private cloud (VPC)
%% subnets with one or many EC2 instances.
%%
%% </dd> </dl>
-module(aws_global_accelerator).

-export([add_custom_routing_endpoints/2,
         add_custom_routing_endpoints/3,
         advertise_byoip_cidr/2,
         advertise_byoip_cidr/3,
         allow_custom_routing_traffic/2,
         allow_custom_routing_traffic/3,
         create_accelerator/2,
         create_accelerator/3,
         create_custom_routing_accelerator/2,
         create_custom_routing_accelerator/3,
         create_custom_routing_endpoint_group/2,
         create_custom_routing_endpoint_group/3,
         create_custom_routing_listener/2,
         create_custom_routing_listener/3,
         create_endpoint_group/2,
         create_endpoint_group/3,
         create_listener/2,
         create_listener/3,
         delete_accelerator/2,
         delete_accelerator/3,
         delete_custom_routing_accelerator/2,
         delete_custom_routing_accelerator/3,
         delete_custom_routing_endpoint_group/2,
         delete_custom_routing_endpoint_group/3,
         delete_custom_routing_listener/2,
         delete_custom_routing_listener/3,
         delete_endpoint_group/2,
         delete_endpoint_group/3,
         delete_listener/2,
         delete_listener/3,
         deny_custom_routing_traffic/2,
         deny_custom_routing_traffic/3,
         deprovision_byoip_cidr/2,
         deprovision_byoip_cidr/3,
         describe_accelerator/2,
         describe_accelerator/3,
         describe_accelerator_attributes/2,
         describe_accelerator_attributes/3,
         describe_custom_routing_accelerator/2,
         describe_custom_routing_accelerator/3,
         describe_custom_routing_accelerator_attributes/2,
         describe_custom_routing_accelerator_attributes/3,
         describe_custom_routing_endpoint_group/2,
         describe_custom_routing_endpoint_group/3,
         describe_custom_routing_listener/2,
         describe_custom_routing_listener/3,
         describe_endpoint_group/2,
         describe_endpoint_group/3,
         describe_listener/2,
         describe_listener/3,
         list_accelerators/2,
         list_accelerators/3,
         list_byoip_cidrs/2,
         list_byoip_cidrs/3,
         list_custom_routing_accelerators/2,
         list_custom_routing_accelerators/3,
         list_custom_routing_endpoint_groups/2,
         list_custom_routing_endpoint_groups/3,
         list_custom_routing_listeners/2,
         list_custom_routing_listeners/3,
         list_custom_routing_port_mappings/2,
         list_custom_routing_port_mappings/3,
         list_custom_routing_port_mappings_by_destination/2,
         list_custom_routing_port_mappings_by_destination/3,
         list_endpoint_groups/2,
         list_endpoint_groups/3,
         list_listeners/2,
         list_listeners/3,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         provision_byoip_cidr/2,
         provision_byoip_cidr/3,
         remove_custom_routing_endpoints/2,
         remove_custom_routing_endpoints/3,
         tag_resource/2,
         tag_resource/3,
         untag_resource/2,
         untag_resource/3,
         update_accelerator/2,
         update_accelerator/3,
         update_accelerator_attributes/2,
         update_accelerator_attributes/3,
         update_custom_routing_accelerator/2,
         update_custom_routing_accelerator/3,
         update_custom_routing_accelerator_attributes/2,
         update_custom_routing_accelerator_attributes/3,
         update_custom_routing_listener/2,
         update_custom_routing_listener/3,
         update_endpoint_group/2,
         update_endpoint_group/3,
         update_listener/2,
         update_listener/3,
         withdraw_byoip_cidr/2,
         withdraw_byoip_cidr/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Associate a virtual private cloud (VPC) subnet endpoint with your
%% custom routing accelerator.
%%
%% The listener port range must be large enough to support the number of IP
%% addresses that can be specified in your subnet. The number of ports
%% required is: subnet size times the number of ports per destination EC2
%% instances. For example, a subnet defined as /24 requires a listener port
%% range of at least 255 ports.
%%
%% Note: You must have enough remaining listener ports available to map to
%% the subnet ports, or the call will fail with a LimitExceededException.
%%
%% By default, all destinations in a subnet in a custom routing accelerator
%% cannot receive traffic. To enable all destinations to receive traffic, or
%% to specify individual port mappings that can receive traffic, see the
%% AllowCustomRoutingTraffic operation.
add_custom_routing_endpoints(Client, Input)
  when is_map(Client), is_map(Input) ->
    add_custom_routing_endpoints(Client, Input, []).
add_custom_routing_endpoints(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"AddCustomRoutingEndpoints">>, Input, Options).

%% @doc Advertises an IPv4 address range that is provisioned for use with
%% your AWS resources through bring your own IP addresses (BYOIP).
%%
%% It can take a few minutes before traffic to the specified addresses starts
%% routing to AWS because of propagation delays.
%%
%% To stop advertising the BYOIP address range, use WithdrawByoipCidr.
%%
%% For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS
%% Global Accelerator Developer Guide.
advertise_byoip_cidr(Client, Input)
  when is_map(Client), is_map(Input) ->
    advertise_byoip_cidr(Client, Input, []).
advertise_byoip_cidr(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"AdvertiseByoipCidr">>, Input, Options).

%% @doc Specify the Amazon EC2 instance (destination) IP addresses and ports
%% for a VPC subnet endpoint that can receive traffic for a custom routing
%% accelerator.
%%
%% You can allow traffic to all destinations in the subnet endpoint, or allow
%% traffic to a specified list of destination IP addresses and ports in the
%% subnet. Note that you cannot specify IP addresses or ports outside of the
%% range that you configured for the endpoint group.
%%
%% After you make changes, you can verify that the updates are complete by
%% checking the status of your accelerator: the status changes from
%% IN_PROGRESS to DEPLOYED.
allow_custom_routing_traffic(Client, Input)
  when is_map(Client), is_map(Input) ->
    allow_custom_routing_traffic(Client, Input, []).
allow_custom_routing_traffic(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"AllowCustomRoutingTraffic">>, Input, Options).

%% @doc Create an accelerator.
%%
%% An accelerator includes one or more listeners that process inbound
%% connections and direct traffic to one or more endpoint groups, each of
%% which includes endpoints, such as Network Load Balancers.
%%
%% Global Accelerator is a global service that supports endpoints in multiple
%% AWS Regions but you must specify the US West (Oregon) Region to create or
%% update accelerators.
create_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_accelerator(Client, Input, []).
create_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateAccelerator">>, Input, Options).

%% @doc Create a custom routing accelerator.
%%
%% A custom routing accelerator directs traffic to one of possibly thousands
%% of Amazon EC2 instance destinations running in a single or multiple
%% virtual private clouds (VPC) subnet endpoints.
%%
%% Be aware that, by default, all destination EC2 instances in a VPC subnet
%% endpoint cannot receive traffic. To enable all destinations to receive
%% traffic, or to specify individual port mappings that can receive traffic,
%% see the AllowCustomRoutingTraffic operation.
%%
%% Global Accelerator is a global service that supports endpoints in multiple
%% AWS Regions but you must specify the US West (Oregon) Region to create or
%% update accelerators.
create_custom_routing_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_custom_routing_accelerator(Client, Input, []).
create_custom_routing_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateCustomRoutingAccelerator">>, Input, Options).

%% @doc Create an endpoint group for the specified listener for a custom
%% routing accelerator.
%%
%% An endpoint group is a collection of endpoints in one AWS Region.
create_custom_routing_endpoint_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_custom_routing_endpoint_group(Client, Input, []).
create_custom_routing_endpoint_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateCustomRoutingEndpointGroup">>, Input, Options).

%% @doc Create a listener to process inbound connections from clients to a
%% custom routing accelerator.
%%
%% Connections arrive to assigned static IP addresses on the port range that
%% you specify.
create_custom_routing_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_custom_routing_listener(Client, Input, []).
create_custom_routing_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateCustomRoutingListener">>, Input, Options).

%% @doc Create an endpoint group for the specified listener.
%%
%% An endpoint group is a collection of endpoints in one AWS Region. A
%% resource must be valid and active when you add it as an endpoint.
create_endpoint_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_endpoint_group(Client, Input, []).
create_endpoint_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateEndpointGroup">>, Input, Options).

%% @doc Create a listener to process inbound connections from clients to an
%% accelerator.
%%
%% Connections arrive to assigned static IP addresses on a port, port range,
%% or list of port ranges that you specify.
create_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_listener(Client, Input, []).
create_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateListener">>, Input, Options).

%% @doc Delete an accelerator.
%%
%% Before you can delete an accelerator, you must disable it and remove all
%% dependent resources (listeners and endpoint groups). To disable the
%% accelerator, update the accelerator to set `Enabled' to false.
%%
%% When you create an accelerator, by default, Global Accelerator provides
%% you with a set of two static IP addresses. Alternatively, you can bring
%% your own IP address ranges to Global Accelerator and assign IP addresses
%% from those ranges.
%%
%% The IP addresses are assigned to your accelerator for as long as it
%% exists, even if you disable the accelerator and it no longer accepts or
%% routes traffic. However, when you delete an accelerator, you lose the
%% static IP addresses that are assigned to the accelerator, so you can no
%% longer route traffic by using them. As a best practice, ensure that you
%% have permissions in place to avoid inadvertently deleting accelerators.
%% You can use IAM policies with Global Accelerator to limit the users who
%% have permissions to delete an accelerator. For more information, see
%% Authentication and Access Control in the AWS Global Accelerator Developer
%% Guide.
delete_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_accelerator(Client, Input, []).
delete_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteAccelerator">>, Input, Options).

%% @doc Delete a custom routing accelerator.
%%
%% Before you can delete an accelerator, you must disable it and remove all
%% dependent resources (listeners and endpoint groups). To disable the
%% accelerator, update the accelerator to set `Enabled' to false.
%%
%% When you create a custom routing accelerator, by default, Global
%% Accelerator provides you with a set of two static IP addresses.
%%
%% The IP addresses are assigned to your accelerator for as long as it
%% exists, even if you disable the accelerator and it no longer accepts or
%% routes traffic. However, when you delete an accelerator, you lose the
%% static IP addresses that are assigned to the accelerator, so you can no
%% longer route traffic by using them. As a best practice, ensure that you
%% have permissions in place to avoid inadvertently deleting accelerators.
%% You can use IAM policies with Global Accelerator to limit the users who
%% have permissions to delete an accelerator. For more information, see
%% Authentication and Access Control in the AWS Global Accelerator Developer
%% Guide.
delete_custom_routing_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_custom_routing_accelerator(Client, Input, []).
delete_custom_routing_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteCustomRoutingAccelerator">>, Input, Options).

%% @doc Delete an endpoint group from a listener for a custom routing
%% accelerator.
delete_custom_routing_endpoint_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_custom_routing_endpoint_group(Client, Input, []).
delete_custom_routing_endpoint_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteCustomRoutingEndpointGroup">>, Input, Options).

%% @doc Delete a listener for a custom routing accelerator.
delete_custom_routing_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_custom_routing_listener(Client, Input, []).
delete_custom_routing_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteCustomRoutingListener">>, Input, Options).

%% @doc Delete an endpoint group from a listener.
delete_endpoint_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_endpoint_group(Client, Input, []).
delete_endpoint_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteEndpointGroup">>, Input, Options).

%% @doc Delete a listener from an accelerator.
delete_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_listener(Client, Input, []).
delete_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteListener">>, Input, Options).

%% @doc Specify the Amazon EC2 instance (destination) IP addresses and ports
%% for a VPC subnet endpoint that cannot receive traffic for a custom routing
%% accelerator.
%%
%% You can deny traffic to all destinations in the VPC endpoint, or deny
%% traffic to a specified list of destination IP addresses and ports. Note
%% that you cannot specify IP addresses or ports outside of the range that
%% you configured for the endpoint group.
%%
%% After you make changes, you can verify that the updates are complete by
%% checking the status of your accelerator: the status changes from
%% IN_PROGRESS to DEPLOYED.
deny_custom_routing_traffic(Client, Input)
  when is_map(Client), is_map(Input) ->
    deny_custom_routing_traffic(Client, Input, []).
deny_custom_routing_traffic(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DenyCustomRoutingTraffic">>, Input, Options).

%% @doc Releases the specified address range that you provisioned to use with
%% your AWS resources through bring your own IP addresses (BYOIP) and deletes
%% the corresponding address pool.
%%
%% Before you can release an address range, you must stop advertising it by
%% using WithdrawByoipCidr and you must not have any accelerators that are
%% using static IP addresses allocated from its address range.
%%
%% For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS
%% Global Accelerator Developer Guide.
deprovision_byoip_cidr(Client, Input)
  when is_map(Client), is_map(Input) ->
    deprovision_byoip_cidr(Client, Input, []).
deprovision_byoip_cidr(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeprovisionByoipCidr">>, Input, Options).

%% @doc Describe an accelerator.
describe_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_accelerator(Client, Input, []).
describe_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeAccelerator">>, Input, Options).

%% @doc Describe the attributes of an accelerator.
describe_accelerator_attributes(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_accelerator_attributes(Client, Input, []).
describe_accelerator_attributes(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeAcceleratorAttributes">>, Input, Options).

%% @doc Describe a custom routing accelerator.
describe_custom_routing_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_custom_routing_accelerator(Client, Input, []).
describe_custom_routing_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeCustomRoutingAccelerator">>, Input, Options).

%% @doc Describe the attributes of a custom routing accelerator.
describe_custom_routing_accelerator_attributes(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_custom_routing_accelerator_attributes(Client, Input, []).
describe_custom_routing_accelerator_attributes(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeCustomRoutingAcceleratorAttributes">>, Input, Options).

%% @doc Describe an endpoint group for a custom routing accelerator.
describe_custom_routing_endpoint_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_custom_routing_endpoint_group(Client, Input, []).
describe_custom_routing_endpoint_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeCustomRoutingEndpointGroup">>, Input, Options).

%% @doc The description of a listener for a custom routing accelerator.
describe_custom_routing_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_custom_routing_listener(Client, Input, []).
describe_custom_routing_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeCustomRoutingListener">>, Input, Options).

%% @doc Describe an endpoint group.
describe_endpoint_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_endpoint_group(Client, Input, []).
describe_endpoint_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeEndpointGroup">>, Input, Options).

%% @doc Describe a listener.
describe_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_listener(Client, Input, []).
describe_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeListener">>, Input, Options).

%% @doc List the accelerators for an AWS account.
list_accelerators(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_accelerators(Client, Input, []).
list_accelerators(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListAccelerators">>, Input, Options).

%% @doc Lists the IP address ranges that were specified in calls to
%% ProvisionByoipCidr, including the current state and a history of state
%% changes.
list_byoip_cidrs(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_byoip_cidrs(Client, Input, []).
list_byoip_cidrs(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListByoipCidrs">>, Input, Options).

%% @doc List the custom routing accelerators for an AWS account.
list_custom_routing_accelerators(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_custom_routing_accelerators(Client, Input, []).
list_custom_routing_accelerators(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListCustomRoutingAccelerators">>, Input, Options).

%% @doc List the endpoint groups that are associated with a listener for a
%% custom routing accelerator.
list_custom_routing_endpoint_groups(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_custom_routing_endpoint_groups(Client, Input, []).
list_custom_routing_endpoint_groups(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListCustomRoutingEndpointGroups">>, Input, Options).

%% @doc List the listeners for a custom routing accelerator.
list_custom_routing_listeners(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_custom_routing_listeners(Client, Input, []).
list_custom_routing_listeners(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListCustomRoutingListeners">>, Input, Options).

%% @doc Provides a complete mapping from the public accelerator IP address
%% and port to destination EC2 instance IP addresses and ports in the virtual
%% public cloud (VPC) subnet endpoint for a custom routing accelerator.
%%
%% For each subnet endpoint that you add, Global Accelerator creates a new
%% static port mapping for the accelerator. The port mappings don't change
%% after Global Accelerator generates them, so you can retrieve and cache the
%% full mapping on your servers.
%%
%% If you remove a subnet from your accelerator, Global Accelerator removes
%% (reclaims) the port mappings. If you add a subnet to your accelerator,
%% Global Accelerator creates new port mappings (the existing ones don't
%% change). If you add or remove EC2 instances in your subnet, the port
%% mappings don't change, because the mappings are created when you add the
%% subnet to Global Accelerator.
%%
%% The mappings also include a flag for each destination denoting which
%% destination IP addresses and ports are allowed or denied traffic.
list_custom_routing_port_mappings(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_custom_routing_port_mappings(Client, Input, []).
list_custom_routing_port_mappings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListCustomRoutingPortMappings">>, Input, Options).

%% @doc List the port mappings for a specific EC2 instance (destination) in a
%% VPC subnet endpoint.
%%
%% The response is the mappings for one destination IP address. This is
%% useful when your subnet endpoint has mappings that span multiple custom
%% routing accelerators in your account, or for scenarios where you only want
%% to list the port mappings for a specific destination instance.
list_custom_routing_port_mappings_by_destination(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_custom_routing_port_mappings_by_destination(Client, Input, []).
list_custom_routing_port_mappings_by_destination(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListCustomRoutingPortMappingsByDestination">>, Input, Options).

%% @doc List the endpoint groups that are associated with a listener.
list_endpoint_groups(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_endpoint_groups(Client, Input, []).
list_endpoint_groups(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListEndpointGroups">>, Input, Options).

%% @doc List the listeners for an accelerator.
list_listeners(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_listeners(Client, Input, []).
list_listeners(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListListeners">>, Input, Options).

%% @doc List all tags for an accelerator.
%%
%% For more information, see Tagging in AWS Global Accelerator in the AWS
%% Global Accelerator Developer Guide.
list_tags_for_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_for_resource(Client, Input, []).
list_tags_for_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsForResource">>, Input, Options).

%% @doc Provisions an IP address range to use with your AWS resources through
%% bring your own IP addresses (BYOIP) and creates a corresponding address
%% pool.
%%
%% After the address range is provisioned, it is ready to be advertised using
%% AdvertiseByoipCidr.
%%
%% For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS
%% Global Accelerator Developer Guide.
provision_byoip_cidr(Client, Input)
  when is_map(Client), is_map(Input) ->
    provision_byoip_cidr(Client, Input, []).
provision_byoip_cidr(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ProvisionByoipCidr">>, Input, Options).

%% @doc Remove endpoints from a custom routing accelerator.
remove_custom_routing_endpoints(Client, Input)
  when is_map(Client), is_map(Input) ->
    remove_custom_routing_endpoints(Client, Input, []).
remove_custom_routing_endpoints(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RemoveCustomRoutingEndpoints">>, Input, Options).

%% @doc Add tags to an accelerator resource.
%%
%% For more information, see Tagging in AWS Global Accelerator in the AWS
%% Global Accelerator Developer Guide.
tag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    tag_resource(Client, Input, []).
tag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TagResource">>, Input, Options).

%% @doc Remove tags from a Global Accelerator resource.
%%
%% When you specify a tag key, the action removes both that key and its
%% associated value. The operation succeeds even if you attempt to remove
%% tags from an accelerator that was already removed.
%%
%% For more information, see Tagging in AWS Global Accelerator in the AWS
%% Global Accelerator Developer Guide.
untag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    untag_resource(Client, Input, []).
untag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UntagResource">>, Input, Options).

%% @doc Update an accelerator.
%%
%% Global Accelerator is a global service that supports endpoints in multiple
%% AWS Regions but you must specify the US West (Oregon) Region to create or
%% update accelerators.
update_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_accelerator(Client, Input, []).
update_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateAccelerator">>, Input, Options).

%% @doc Update the attributes for an accelerator.
update_accelerator_attributes(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_accelerator_attributes(Client, Input, []).
update_accelerator_attributes(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateAcceleratorAttributes">>, Input, Options).

%% @doc Update a custom routing accelerator.
update_custom_routing_accelerator(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_custom_routing_accelerator(Client, Input, []).
update_custom_routing_accelerator(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateCustomRoutingAccelerator">>, Input, Options).

%% @doc Update the attributes for a custom routing accelerator.
update_custom_routing_accelerator_attributes(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_custom_routing_accelerator_attributes(Client, Input, []).
update_custom_routing_accelerator_attributes(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateCustomRoutingAcceleratorAttributes">>, Input, Options).

%% @doc Update a listener for a custom routing accelerator.
update_custom_routing_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_custom_routing_listener(Client, Input, []).
update_custom_routing_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateCustomRoutingListener">>, Input, Options).

%% @doc Update an endpoint group.
%%
%% A resource must be valid and active when you add it as an endpoint.
update_endpoint_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_endpoint_group(Client, Input, []).
update_endpoint_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateEndpointGroup">>, Input, Options).

%% @doc Update a listener.
update_listener(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_listener(Client, Input, []).
update_listener(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateListener">>, Input, Options).

%% @doc Stops advertising an address range that is provisioned as an address
%% pool.
%%
%% You can perform this operation at most once every 10 seconds, even if you
%% specify different address ranges each time.
%%
%% It can take a few minutes before traffic to the specified addresses stops
%% routing to AWS because of propagation delays.
%%
%% For more information, see Bring Your Own IP Addresses (BYOIP) in the AWS
%% Global Accelerator Developer Guide.
withdraw_byoip_cidr(Client, Input)
  when is_map(Client), is_map(Input) ->
    withdraw_byoip_cidr(Client, Input, []).
withdraw_byoip_cidr(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"WithdrawByoipCidr">>, Input, Options).

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
    Client1 = Client#{service => <<"globalaccelerator">>},
    Host = build_host(<<"globalaccelerator">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.1">>},
        {<<"X-Amz-Target">>, <<"GlobalAccelerator_V20180706.", Action/binary>>}
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
