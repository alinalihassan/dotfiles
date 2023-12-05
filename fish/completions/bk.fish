# bk completion fish
set -l __bk_command_group_auth_issue_authxagent_user_token auth:issue-authxagent-user-token cloud:auth:issue-authxagent-user-token
set -l __bk_command_group_auth_issue_okta_token auth:issue-okta-token cloud:auth:issue-okta-token
set -l __bk_command_group_auth_issue_sso_access_token auth:issue-sso-access-token cloud:auth:issue-sso-access-token
set -l __bk_command_group_auth_issue_sso_refresh_token auth:issue-sso-refresh-token cloud:auth:issue-sso-refresh-token
set -l __bk_command_group_auth_issue_token auth:issue-token cloud:auth:issue-token
set -l __bk_command_group_auth_login auth:login cloud:auth:login
set -l __bk_command_group_auth_vault_login auth:vault-login cloud:auth:vault-login
set -l __bk_command_group_config_current_context config:current-context cloud:config:current-context
set -l __bk_command_group_config_get_contexts config:get-contexts cloud:config:get-contexts
set -l __bk_command_group_config_view config:view cloud:config:view
set -l __bk_command_group_context context cloud:context ctx
set -l __bk_command_group_context_use context:use cloud:use:context ctx:use
set -l __bk_command_group_cloud_clusters cloud:clusters cloud:cluster:list cloud:cluster:links
set -l __bk_command_group_context_use_cluster context:use:cluster cloud:use:cluster ctx:use:cluster cloud:clusters:use
set -l __bk_command_group_config_get_component_contexts config:get-component-contexts cloud:config:get-component-contexts cloud:config:get-service-contexts config:get-service-contexts
set -l __bk_command_group_config_get_installation_contexts config:get-installation-contexts cloud:config:get-installation-contexts
set -l __bk_command_group_config_get_project_contexts config:get-project-contexts cloud:config:get-project-contexts
set -l __bk_command_group_context_use_component context:use:component cloud:use:service cloud:use:component ctx:use:service ctx:use:component sd:services:use sd:components:use
set -l __bk_command_group_context_use_installation context:use:installation cloud:use:installation sd:installations:use ctx:use:installation
set -l __bk_command_group_context_use_project context:use:project cloud:use:project sd:projects:use ctx:use:project
set -l __bk_command_group_sd_components sd:components cloud:get:components cloud:get:services sd:components:get sd:services:get sd:services
set -l __bk_command_group_sd_components_bootstrap sd:components:bootstrap cloud:bootstrap:component cloud:bootstrap:service sd:services:bootstrap
set -l __bk_command_group_sd_components_create sd:components:create cloud:create:component cloud:create:service sd:services:create
set -l __bk_command_group_sd_components_delete sd:components:delete cloud:delete:service cloud:delete:component sd:services:delete
set -l __bk_command_group_sd_dependencies sd:dependencies cloud:get:dependencies sd:dependencies:get
set -l __bk_command_group_sd_dependencies_delete sd:dependencies:delete cloud:delete:dependency
set -l __bk_command_group_sd_dependencies_request sd:dependencies:request cloud:create:dependency-request
set -l __bk_command_group_sd_installations sd:installations cloud:get:installations sd:installations:get
set -l __bk_command_group_sd_installations_bootstrap sd:installations:bootstrap cloud:bootstrap:installation
set -l __bk_command_group_sd_installations_create sd:installations:create cloud:create:installation
set -l __bk_command_group_sd_installations_delete sd:installations:delete cloud:delete:installation
set -l __bk_command_group_sd_members sd:members cloud:get:members sd:members:get
set -l __bk_command_group_sd_members_create sd:members:create cloud:create:member
set -l __bk_command_group_sd_members_delete sd:members:delete cloud:delete:member
set -l __bk_command_group_sd_playground sd:playground cloud:bootstrap:playground
set -l __bk_command_group_sd_projects sd:projects cloud:get:projects sd:projects:get
set -l __bk_command_group_sd_projects_create sd:projects:create cloud:create:project
set -l __bk_command_group_sd_projects_delete sd:projects:delete cloud:delete:project
set -l __bk_command_group_sd_projects_update sd:projects:update cloud:update:project
set -l __bk_command_group_plugins_install plugins:install plugins:add
set -l __bk_command_group_plugins_uninstall plugins:uninstall plugins:unlink plugins:remove

function __bk_autocomplete_project
    bk config:get-project-contexts --columns=project --no-header 2>/dev/null | string trim
end
function __bk_autocomplete_component
    bk config:get-component-contexts --columns=component --no-header 2>/dev/null | string trim
end
function __bk_autocomplete_installation
    bk config:get-installation-contexts --columns=installation --no-header 2>/dev/null | string trim
end
function __bk_autocomplete_context
    bk config:get-contexts --output=names 2>/dev/null | string trim
end
function __bk_autocomplete_clusterName
    kubectl config get-clusters 2>/dev/null | grep "bplatform-" | string trim
end

complete -c bk -n "__fish_is_nth_token 1" -d 'issue user token using authxagent' -kxa "$__bk_command_group_auth_issue_authxagent_user_token"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_issue_authxagent_user_token" -l output -d 'output format, if not specified will just output the token value string' -x -a "exec-credentials"
complete -c bk -n "__fish_is_nth_token 1" -d 'issue Okta token using BKS OKTA Integration Auth Server' -kxa "$__bk_command_group_auth_issue_okta_token"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_issue_okta_token" -l output -d 'output format, if not specified will just output the token value string' -x -a "exec-credentials"
complete -c bk -n "__fish_is_nth_token 1" -d 'issue access token based on refresh token using SSO' -kxa "$__bk_command_group_auth_issue_sso_access_token"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_issue_sso_access_token" -l output -d 'output format, if not specified will just output the token value string' -x -a "exec-credentials"
complete -c bk -n "__fish_is_nth_token 1" -d 'issue refresh token using SSO' -kxa "$__bk_command_group_auth_issue_sso_refresh_token"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_issue_sso_refresh_token" -l output -d 'output format, if not specified will just output the token value string' -x -a "exec-credentials"
complete -c bk -n "__fish_is_nth_token 1" -d 'issue token using any of the available backends' -kxa "$__bk_command_group_auth_issue_token"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_issue_token" -l output -d 'output format, if not specified will just output the token value string' -x -a "exec-credentials"
complete -c bk -n "__fish_is_nth_token 1" -d 'login into BKS Kubernetes' -kxa "$__bk_command_group_auth_login"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l mode -d 'define how to log in kubernetes' -x -a "sso authxagent"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l cache-certificates -d 'cache Booking\'s certificates to allow TLS with self-signed Booking APIs'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l check-version -d 'validate bkcloud and kubectl versions'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l check-obsolete-settings -d 'perform check of obsolete settings in any of config files'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l check-cluster-status -d 'print a warning if cluster status is not \'Ready\''
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l update-clusters -d 'synchronize list of clusters in kubeconfig with Cluster Directory'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l update-contexts-users -d 'synchronize users of contexts in kubeconfig based of auth-mode of each cluster'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_login" -l dqs-login -d 'Run login in dqs SSO'
complete -c bk -n "__fish_is_nth_token 1" -d 'login to Vault' -kxa "$__bk_command_group_auth_vault_login"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_auth_vault_login" -l check-vault-addr -d 'checks if the VAULT_ADDR environment variable is set to PROD or DEV/DQS vault address'
complete -c bk -n "__fish_is_nth_token 1" -d 'outputs shell completion code for the specified shell (bash or zsh).' -kxa "completion"
complete -c bk -n "__fish_seen_subcommand_from completion" -l force -s f -d 'Force completion to be re-computed even if files are already existing, similar to setting environment variable BK_COMPLETION_FORCE_RECOMPUTE=1'
complete -c bk -n "__fish_seen_subcommand_from completion" -l aliases -d 'whether or not to autocomplete command aliases'
complete -c bk -n "__fish_is_nth_token 1" -d 'list all available commands of your `bk` CLI, including currently installed plugins\' commands' -kxa "completion:commands"
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from completion:commands" -l aliases -d 'whether or not to list command aliases'
complete -c bk -n "__fish_is_nth_token 1" -d 'cache Booking Certificates for the \'bk\' HTTP client.' -kxa "config:certificates:cache"
complete -c bk -n "__fish_is_nth_token 1" -d 'display the current context' -kxa "$__bk_command_group_config_current_context"
complete -c bk -n "__fish_is_nth_token 1" -d 'list configured contexts' -kxa "$__bk_command_group_config_get_contexts"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l output -d 'output format' -x -a "names table"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_contexts" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_is_nth_token 1" -d 'display bkconfig settings' -kxa "$__bk_command_group_config_view"
complete -c bk -n "__fish_is_nth_token 1" -d 'display information about current contexts' -kxa "$__bk_command_group_context"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context" -l extra -d 'display additional information that requires external communication'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context" -l output -d 'output format' -x -a "json yaml ps1"
complete -c bk -n "__fish_is_nth_token 1" -d 'switch bk context' -kxa "$__bk_command_group_context_use"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use" -fa "(__bk_autocomplete_context)"
complete -c bk -n "__fish_is_nth_token 1" -d 'list all available Booking plugin' -kxa "plugins:discover"
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from plugins:discover" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_is_nth_token 1" -d 'lists all available versions of a plugin' -kxa "plugins:versions"
complete -c bk -n "__fish_is_nth_token 1" -d 'get latest available version of a plugin' -kxa "plugins:versions:latest"
complete -c bk -n "__fish_seen_subcommand_from plugins:versions:latest" -l dist-tag -d 'dist-tag of which to display the latest version'
complete -c bk -n "__fish_is_nth_token 1" -d 'display who you should contact in case you need support with a command (works with aliases as well)' -kxa "support"
complete -c bk -n "__fish_is_nth_token 1" -d 'update the bk CLI' -kxa "update"
complete -c bk -n "__fish_is_nth_token 1" -d 'show available BKS Kubernetes clusters' -kxa "$__bk_command_group_cloud_clusters"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_cloud_clusters" -l all -d 'show all clusters, by default it only shows application, development, management clusters'
complete -c bk -n "__fish_is_nth_token 1" -d 'create a subscription in AlertAPI to receive alerts about issues in BKS Kubernetes clusters' -kxa "cloud:subscribe:cluster-alerts"
complete -c bk -n "__fish_seen_subcommand_from cloud:subscribe:cluster-alerts" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from cloud:subscribe:cluster-alerts" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_is_nth_token 1" -d 'create a subscription in AlertAPI to receive alerts about exhausting resources in your namespace in BKS Kubernetes clusters' -kxa "cloud:subscribe:quota-alerts"
complete -c bk -n "__fish_seen_subcommand_from cloud:subscribe:quota-alerts" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from cloud:subscribe:quota-alerts" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_is_nth_token 1" -d 'create a subscription in AlertAPI to receive notifications about ongoing rollouts of your service in BKS Kubernetes clusters,' -kxa "cloud:subscribe:rollout-info"
complete -c bk -n "__fish_seen_subcommand_from cloud:subscribe:rollout-info" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from cloud:subscribe:rollout-info" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_is_nth_token 1" -d 'switch cluster context in kube config' -kxa "$__bk_command_group_context_use_cluster"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_cluster" -l check-cluster-status -d 'whether or not to print a warning if cluster status is not \'Ready\''
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_cluster" -l set-as-preferred-cluster -d 'store given cluster as preferred cluster, preferred cluster is one which an installation uses by default'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_cluster" -l allow-testing-clusters -d 'allow switching to test clusters as well'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_cluster" -l check-if-installation-provisioned-in-cluster -d 'whether or not to fail if no installation is provisioned in the specified cluster'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_cluster" -l check-if-cluster-exists -d 'UNSAFE: whether or not to fail if the specified cluster exists in Cluster Directory'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_cluster" -l namespace -d 'namespace to use, defaults to the namespace of the current kubectl context, or sd context if kubectl context is unset'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_cluster" -fa "(__bk_autocomplete_clusterName)"
complete -c bk -n "__fish_is_nth_token 1" -d 'Add the "harness" attribute to the current SD installation' -kxa "harness:installation:harness-sd-attribute:add"
complete -c bk -n "__fish_is_nth_token 1" -d 'Remove the "harness" attribute from the current SD installation' -kxa "harness:installation:harness-sd-attribute:remove"
complete -c bk -n "__fish_is_nth_token 1" -d 'Get pods deployed by Harness for your application from all clusters' -kxa "harness:pods:status"
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l installation -s i -d 'Get pods from another installation' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from harness:pods:status" -l timeout -s t -d 'Kubernetes get pod requests timeout in ms'
complete -c bk -n "__fish_is_nth_token 1" -d 'Generate Harness configuration for specified project and create MRs in deployments repositories.' -kxa "harness:project:generate-config"
complete -c bk -n "__fish_seen_subcommand_from harness:project:generate-config" -l project -s p -d 'SD project (current bk context project by default)' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from harness:project:generate-config" -l regex -s r -d 'Regex to choose projects'
complete -c bk -n "__fish_seen_subcommand_from harness:project:generate-config" -l template-dir -s t -d 'Template dir name in "harness-templates-and-values" repo (e.g. "cloud-application-template/cdk" for cloud apps)'
complete -c bk -n "__fish_seen_subcommand_from harness:project:generate-config" -l local-data -s l -d 'Optional local yaml file to provide extra data to render configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'Bootstrap a new component in Harness, generate Harness configs, add "harness" attribute to SD service.' -kxa "harness:service:bootstrap"
complete -c bk -n "__fish_seen_subcommand_from harness:service:bootstrap" -l project -s p -d 'Service Directory project' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from harness:service:bootstrap" -l component -s c -d 'Service Directory component' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from harness:service:bootstrap" -l imageRepo -r -s i -d 'Container image repository' -x -a "docker docker-dev docker-image-builder docker-build docker-build-sandbox"
complete -c bk -n "__fish_seen_subcommand_from harness:service:bootstrap" -l skip-installation-presence-check -s s -d 'Allow to generate files even if "kubernetes-prod" or "kubernetes-dqs" installation is missing'
complete -c bk -n "__fish_seen_subcommand_from harness:service:bootstrap" -l template-dir -s t -d 'Template directory in "harness-templates-and-values" repo (e.g. "cloud-application-template/cdk")'
complete -c bk -n "__fish_seen_subcommand_from harness:service:bootstrap" -l local-data -s l -d 'Optional local yaml file to provide extra data to render configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'Generate Harness config(s) for application' -kxa "harness:service:generate-harnessconfig"
complete -c bk -n "__fish_seen_subcommand_from harness:service:generate-harnessconfig" -l project -r -s p -d 'Service Directory project' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from harness:service:generate-harnessconfig" -l component -r -s c -d 'Service Directory component' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from harness:service:generate-harnessconfig" -l installation -r -s i -d 'Service Directory installation' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from harness:service:generate-harnessconfig" -l template-file -s t -d 'Config template file, omit to use default Harness config (resources/harnessconfig-templ.yaml)'
complete -c bk -n "__fish_seen_subcommand_from harness:service:generate-harnessconfig" -l chart-name -r -s n -d 'Helm chart name (java, perl, nodejs), omit to use default'
complete -c bk -n "__fish_seen_subcommand_from harness:service:generate-harnessconfig" -l chart-version -r -s V -d 'Helm chart version (e.g. ^5), omit to use default'
complete -c bk -n "__fish_is_nth_token 1" -d 'Update service\'s harness configs so they have the meta labels we need' -kxa "harness:service:update-configs"
complete -c bk -n "__fish_seen_subcommand_from harness:service:update-configs" -l project -r -s p -d 'service directory project' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from harness:service:update-configs" -l component -r -s c -d 'service directory component' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_is_nth_token 1" -d 'list configured component contexts for the current project' -kxa "$__bk_command_group_config_get_component_contexts"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l output -d 'output format' -x -a "names table component-names"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_component_contexts" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_is_nth_token 1" -d 'list configured installation contexts for the current project and component' -kxa "$__bk_command_group_config_get_installation_contexts"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l output -d 'output format' -x -a "names table installation-names"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_installation_contexts" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_is_nth_token 1" -d 'list configured project contexts' -kxa "$__bk_command_group_config_get_project_contexts"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l output -d 'output format' -x -a "names table project-names"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_config_get_project_contexts" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_is_nth_token 1" -d 'switch sd context to the specified component' -kxa "$__bk_command_group_context_use_component"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_component" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_component" -fa "(__bk_autocomplete_component)"
complete -c bk -n "__fish_is_nth_token 1" -d 'switch sd context to the specified installation' -kxa "$__bk_command_group_context_use_installation"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_installation" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_installation" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_installation" -l mine -d 'selects the first installation of the current user'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_installation" -fa "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_is_nth_token 1" -d 'switch sd context to the specified project' -kxa "$__bk_command_group_context_use_project"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_context_use_project" -fa "(__bk_autocomplete_project)"
complete -c bk -n "__fish_is_nth_token 1" -d 'show components in Service Directory' -kxa "$__bk_command_group_sd_components"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_is_nth_token 1" -d 'bootstrap a component' -kxa "$__bk_command_group_sd_components_bootstrap"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_bootstrap" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'create new component in Service Directory' -kxa "$__bk_command_group_sd_components_create"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l service-level -d 'service level of given component' -x -a "L1 L2 L3"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l business-impact -d 'business impact of given component' -x -a "high low medium"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l attributes -d 'add an attribute, can be specified multiple times to add multiple attributes' -x -a "kubernetes gcp"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l kind -d 'kind of given component' -x -a "service webapp infrastructure"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l contract -d 'technology or protocol of the component kind' -x -a "not_applicable terraform_workspace"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_create" -l repo-url -d 'GitLab repository URL'
complete -c bk -n "__fish_is_nth_token 1" -d 'delete existing component in Service Directory' -kxa "$__bk_command_group_sd_components_delete"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_delete" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_components_delete" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'show dependencies of an installation in Service Directory' -kxa "$__bk_command_group_sd_dependencies"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies" -l installation -d 'override installation name' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_is_nth_token 1" -d 'delete existing dependency of an installation in Service Directory' -kxa "$__bk_command_group_sd_dependencies_delete"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies_delete" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies_delete" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies_delete" -l installation -d 'override installation name' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_is_nth_token 1" -d 'set reason for a service directory dependency' -kxa "sd:dependencies:reason"
complete -c bk -n "__fish_seen_subcommand_from sd:dependencies:reason" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from sd:dependencies:reason" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from sd:dependencies:reason" -l dependency -r -s d -d 'name of the depenendency'
complete -c bk -n "__fish_seen_subcommand_from sd:dependencies:reason" -l reason -r -s r -d 'reason for consuming the dependency'
complete -c bk -n "__fish_is_nth_token 1" -d 'request dependencies for an installation' -kxa "$__bk_command_group_sd_dependencies_request"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies_request" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies_request" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies_request" -l installation -d 'override installation name' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_dependencies_request" -l filename -r -s f -d 'path to dependencies.yaml or application.yaml'
complete -c bk -n "__fish_is_nth_token 1" -d 'show installations in Service Directory' -kxa "$__bk_command_group_sd_installations"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_is_nth_token 1" -d 'bootstrap an installation' -kxa "$__bk_command_group_sd_installations_bootstrap"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_bootstrap" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'create new installation in Service Directory' -kxa "$__bk_command_group_sd_installations_create"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l personal -d 'create personal installation, such installations are attributed with a username'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l provider -r -d 'provider to use' -x -a "kubernetes gcp baremetal aws bcf"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l serverdb-role -r -d 'specify the ServerDB role'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l gcp-network-type -r -d 'specify GCP network type' -x -a "sandboxed vpc"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l gcp-resource-management -r -d 'specify GCP management interface, one of: gcp-web-console, bplatform.' -x -a "gcp-web-console bplatform"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l aws-region -r -d 'specify AWS region for bcf installation' -x -a "eu-central-1 eu-west-2"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l labels -r -d 'specify labels for bcf installation, e.g. {"lab1":"v1","lab2":"v2"}'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_create" -l force -d 'Enforce to do not recommended action'
complete -c bk -n "__fish_is_nth_token 1" -d 'delete existing installation in Service Directory' -kxa "$__bk_command_group_sd_installations_delete"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_delete" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_delete" -l component -d 'override component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_delete" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_installations_delete" -l assume-yes -s y -d 'answer yes for all questions'
complete -c bk -n "__fish_is_nth_token 1" -d 'show members of a Service Directory project' -kxa "$__bk_command_group_sd_members"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_is_nth_token 1" -d 'create new member in a Service Directory project' -kxa "$__bk_command_group_sd_members_create"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members_create" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members_create" -l role -r -d 'role to grant to the new member' -x -a "admin editor viewer contributor"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members_create" -l orgunit-id -d 'orgunit id of the team to add, you could find it in the team\'s Office page'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members_create" -l username -d 'username of the individual member to add'
complete -c bk -n "__fish_is_nth_token 1" -d 'delete existing member in a project' -kxa "$__bk_command_group_sd_members_delete"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members_delete" -l project -d 'override project name' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members_delete" -l orgunit-id -d 'orgunit id of the team to delete, you could find it in the team\'s Office page'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_members_delete" -l username -d 'username of the individual member to delete'
complete -c bk -n "__fish_is_nth_token 1" -d 'bootstrap a playground component' -kxa "$__bk_command_group_sd_playground"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_playground" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'show projects in Service Directory' -kxa "$__bk_command_group_sd_projects"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l output -d 'output in a more machine friendly format' -x -a "csv json yaml"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l all -d 'display all projects excluding personal projects'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects" -l show-personal -d 'include personal projects in the output, works only together with --all'
complete -c bk -n "__fish_is_nth_token 1" -d 'create new project in Service Directory' -kxa "$__bk_command_group_sd_projects_create"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_create" -l individual-owners -d 'individual owner (a person) that owns that project, e.g. tbion, can be specified multiple times'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_create" -l team-owners -d 'team owner that owns that project, e.g. 60002698, can be specified multiple times'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_create" -l individual-members -d 'the individual members of the project.'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_create" -l team-members -d 'the team members of the project.'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_create" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'delete existing project in Service Directory' -kxa "$__bk_command_group_sd_projects_delete"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_delete" -l update-configs -d 'whether or not to update context information in configs'
complete -c bk -n "__fish_is_nth_token 1" -d 'update project in Service Directory' -kxa "$__bk_command_group_sd_projects_update"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_update" -l attributes -d 'add an attribute, can be specified multiple times to add multiple attributes' -x -a "kubernetes gcp bcf aws"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_sd_projects_update" -l delete-attributes -d 'delete attribute, can be specified multiple times to delete multiple attributes' -x -a "kubernetes gcp bcf aws"
complete -c bk -n "__fish_is_nth_token 1" -d 'A tool to add GraphQL support into existing Java services.' -kxa "java:add:graphql"
complete -c bk -n "__fish_seen_subcommand_from java:add:graphql" -l serviceDir -d '[Optional] Absolute path to service folder.'
complete -c bk -n "__fish_is_nth_token 1" -d 'A scaffolding tool for new Java applications' -kxa "java:bootstrap"
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l baremetal -d 'This service is running on baremetal. If not provided, BKS service is assumed.'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l project-name -d 'BKS project name'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l service-name -d 'Component (service) name. Application name in case of baremetal'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l java-package -d 'Java package'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l group-id -d 'Maven group id'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l artifact-id -d 'Maven artifact id'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l framework -d 'SB3 or DW'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l sb3-template -d 'Spring Boot 3 template (sb3-simple, sb3-jdbc, sb3-jpa, sb3-graphql)'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l build-tool -d 'Maven or Bazel'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l monorepo -d 'This service is part of java monorepo'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l java-version -d 'Java version'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l background-tasks -d 'Add a demo background task to the generated app'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l mysql -d 'Add a demo MySql database to the generated app'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l renovate -d 'Add \'renovate.json5\' file to receive dependency update MRs'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l diprocessor -d 'Add DI Processor to the generated app - https://gitlab.booking.com/pfs/dropwizard-di-processor/-/blob/dev/README.md'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l slo -d 'Add default SLO configuration to the generated app - https://docs.booking.com/java-service-maturity/reliability/slo_service.html'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l graphql -d 'Add GraphQL integration library to the generated app'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l graphql-tools -d 'Add GraphQL playground and visualization tools to the generated app'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l security -d 'Add security to the generated app'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l passport-policy -d 'Which Passport policy to use'
complete -c bk -n "__fish_seen_subcommand_from java:bootstrap" -l passport-policy-action -d 'Which Passport policy action to use'
complete -c bk -n "__fish_is_nth_token 1" -d 'A tool to generate Run configuration files for your Java Service' -kxa "java:generate:run-configs"
complete -c bk -n "__fish_seen_subcommand_from java:generate:run-configs" -l serviceDir -d 'optional, absolute path to service folder'
complete -c bk -n "__fish_is_nth_token 1" -d 'A tool to run a bare metal Java Service on your Laptop' -kxa "java:local:baremetal"
complete -c bk -n "__fish_seen_subcommand_from java:local:baremetal" -l kvm -d 'optional, kvm which will be used to fetch required files and forward ports'
complete -c bk -n "__fish_is_nth_token 1" -d '' -kxa "java:local:k8s"
complete -c bk -n "__fish_seen_subcommand_from java:local:k8s" -l context -d 'optional, dev service context which will be used to fetch required files and forward ports' -x -a "(__bk_autocomplete_context)"
complete -c bk -n "__fish_seen_subcommand_from java:local:k8s" -l additionalPort -d 'additional ports to forward (can be in the format "9092" or "9092:9093") and can be provided multiple times'
complete -c bk -n "__fish_seen_subcommand_from java:local:k8s" -l debug -d 'should print debug logs'
complete -c bk -n "__fish_is_nth_token 1" -d 'show current Rollout Blocks' -kxa "deploy:blocks"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l output -s o -d 'output format' -x -a "json yaml csv"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_is_nth_token 1" -d 'block rollouts for baremetal' -kxa "deploy:blocks:baremetal"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l all -s a -d 'all rollouts should be blocked (alias for --role="*" --repo="*")'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l dry-run -d 'if true, only print the block that would be created, without creating it'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l project -s p -d 'ServiceDirectory project (kubernetes namespace)' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l component -s c -d 'ServiceDirectory component' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l persona -d 'persona name'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l role -d 'role name'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l repo -d 'repo name'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l reason -r -s r -d 'reason for blocking rollouts'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:baremetal" -l output -s o -d 'output format' -x -a "json yaml"
complete -c bk -n "__fish_is_nth_token 1" -d 'block rollouts for B.Platform(kubernetes)' -kxa "deploy:blocks:bplatform"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l all -s a -d 'all rollouts should be blocked (alias for --project="*")'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l env -s e -d 'environment to block rollouts in' -x -a "dqs prod"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l clusters -s c -d 'deprecated, this is a no-op option for now'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l project -s p -d 'ServiceDirectory project (kubernetes namespace)' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l persona -d 'persona name (Backend will be autoguessed)'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l reason -r -s r -d 'reason for blocking rollouts'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l output -s o -d 'output format' -x -a "json yaml"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:bplatform" -l dry-run -d 'if true, only print the block that would be created, without creating it'
complete -c bk -n "__fish_is_nth_token 1" -d 'check existing rollout blocks with filtering' -kxa "deploy:blocks:check"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:check" -l env -s e -d 'environment to check blocked rollouts' -x -a "dqs prod"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:check" -l backend -s b -d 'backend selection' -x -a "baremetal/git-deploy experiment/change kubernetes/harness"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:check" -l project -s p -d 'ServiceDirectory project (kubernetes namespace)' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:check" -l component -s c -d 'component name' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:check" -l output -s o -d 'output format' -x -a "json yaml"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:check" -l dry-run -d 'if true, only print the block that would be created, without creating it'
complete -c bk -n "__fish_is_nth_token 1" -d 'show historical Rollout Blocks' -kxa "deploy:blocks:history"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l columns -d 'only show provided columns (comma-separated)'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l sort -d 'property to sort by (prepend \'-\' for descending)'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l filter -d 'filter property by partial string matching, ex: name=foo'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l csv -d 'output is csv format [alias: --output=csv]'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l output -s o -d 'output format' -x -a "json yaml csv"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l extended -s x -d 'show extra columns'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l truncate -d 'whether or not to truncate output to fit screen'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:history" -l header -d 'whether or not to show table header from output'
complete -c bk -n "__fish_is_nth_token 1" -d 'unblock rollouts' -kxa "deploy:blocks:remove"
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:remove" -l id -d 'id or affinity of rollouts to unblock'
complete -c bk -n "__fish_seen_subcommand_from deploy:blocks:remove" -l output -s o -d 'output format' -x -a "json yaml"
complete -c bk -n "__fish_is_nth_token 1" -d 'Build your image without pushing it' -kxa "deploy:image:build"
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l environment -s e -d 'environment you want to configure against, e.g.: dev, dqs, or prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l installation -s i -d 'installation name you would like to deploy' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l image-url -d 'use a specific docker image, implies no-build'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l no-build -d 'skip docker build in dev'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l always-build -d 'force docker build in dqs and prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l pull-image -d 'attempt to pull a newer version of the base image before building'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l no-input -d 'error or make an assumption if we would ask for input'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l perl -d 'do some automatic stuff if you\'re a Perl application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l java -d 'do some automatic stuff if you\'re a Java application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l nodejs -d 'do some automatic stuff if you\'re a NodeJs application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l generic -d 'avoid any automatic stuff, since you\'re a generic application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l app-yaml -d 'path to an harnessconfig.yaml (default: ./kubernetes/harnessconfig-$env[-$installationTag].yaml)'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l check-dot-deploy -d 'check the existence of .deploy file in the image and validate the file'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l dot-deploy-check-dir -d 'directory where a check for .deploy file will be performed'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l dot-deploy-auto-generation -d 'choose how we generate a .deploy for your image. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l dockerfile -d 'Name with or without path of the custom Dockerfile. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l build-arg -d 'build arg for docker build'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:build" -l kubernetes-folder -s k -d 'specify a project kubernetes folder to load comma separated merged Harness config for deployment'
complete -c bk -n "__fish_is_nth_token 1" -d 'Build and push your image' -kxa "deploy:image:push"
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l environment -s e -d 'environment you want to configure against, e.g.: dev, dqs, or prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l installation -s i -d 'installation name you would like to deploy' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l image-url -d 'use a specific docker image, implies no-build'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l no-build -d 'skip docker build in dev'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l always-build -d 'force docker build in dqs and prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l pull-image -d 'attempt to pull a newer version of the base image before building'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l no-input -d 'error or make an assumption if we would ask for input'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l perl -d 'do some automatic stuff if you\'re a Perl application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l java -d 'do some automatic stuff if you\'re a Java application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l nodejs -d 'do some automatic stuff if you\'re a NodeJs application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l generic -d 'avoid any automatic stuff, since you\'re a generic application'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l app-yaml -d 'path to an harnessconfig.yaml (default: ./kubernetes/harnessconfig-$env[-$installationTag].yaml)'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l check-dot-deploy -d 'check the existence of .deploy file in the image and validate the file'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l dot-deploy-check-dir -d 'directory where a check for .deploy file will be performed'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l dot-deploy-auto-generation -d 'choose how we generate a .deploy for your image. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l dockerfile -d 'Name with or without path of the custom Dockerfile. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l build-arg -d 'build arg for docker build'
complete -c bk -n "__fish_seen_subcommand_from deploy:image:push" -l kubernetes-folder -s k -d 'specify a project kubernetes folder to load comma separated merged Harness config for deployment'
complete -c bk -n "__fish_is_nth_token 1" -d 'Print current deploy config' -kxa "deploy:meta:config"
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l environment -s e -d 'environment you want to configure against, e.g.: dev, dqs, or prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l installation -s i -d 'installation name you would like to deploy' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l image-url -d 'use a specific docker image, implies no-build'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l no-build -d 'skip docker build in dev'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l always-build -d 'force docker build in dqs and prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l pull-image -d 'attempt to pull a newer version of the base image before building'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l no-input -d 'error or make an assumption if we would ask for input'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l perl -d 'do some automatic stuff if you\'re a Perl application'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l java -d 'do some automatic stuff if you\'re a Java application'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l nodejs -d 'do some automatic stuff if you\'re a NodeJs application'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l generic -d 'avoid any automatic stuff, since you\'re a generic application'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l app-yaml -d 'path to an harnessconfig.yaml (default: ./kubernetes/harnessconfig-$env[-$installationTag].yaml)'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l check-dot-deploy -d 'check the existence of .deploy file in the image and validate the file'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l dot-deploy-check-dir -d 'directory where a check for .deploy file will be performed'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l dot-deploy-auto-generation -d 'choose how we generate a .deploy for your image. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l dockerfile -d 'Name with or without path of the custom Dockerfile. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l build-arg -d 'build arg for docker build'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l kubernetes-folder -s k -d 'specify a project kubernetes folder to load comma separated merged Harness config for deployment'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l watch -d 'watch the status of the rollout until it reaches the target step'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l dry-run -d 'dry-run of rollout'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l skip-image-presence-check -d 'skip checking image presence in artifactory'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l skip-git-tag -d 'skip creating git tag for rollout'
complete -c bk -n "__fish_seen_subcommand_from deploy:meta:config" -l no-dependency-registration -d 'don\'t attempt to register dependencies with Service Directory before the rollout'
complete -c bk -n "__fish_is_nth_token 1" -d 'Rollout the latest version of your code' -kxa "deploy:rollout"
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l environment -s e -d 'environment you want to configure against, e.g.: dev, dqs, or prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l installation -s i -d 'installation name you would like to deploy' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l image-url -d 'use a specific docker image, implies no-build'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l no-build -d 'skip docker build in dev'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l always-build -d 'force docker build in dqs and prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l pull-image -d 'attempt to pull a newer version of the base image before building'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l no-input -d 'error or make an assumption if we would ask for input'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l perl -d 'do some automatic stuff if you\'re a Perl application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l java -d 'do some automatic stuff if you\'re a Java application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l nodejs -d 'do some automatic stuff if you\'re a NodeJs application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l generic -d 'avoid any automatic stuff, since you\'re a generic application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l app-yaml -d 'path to an harnessconfig.yaml (default: ./kubernetes/harnessconfig-$env[-$installationTag].yaml)'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l check-dot-deploy -d 'check the existence of .deploy file in the image and validate the file'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l dot-deploy-check-dir -d 'directory where a check for .deploy file will be performed'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l dot-deploy-auto-generation -d 'choose how we generate a .deploy for your image. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l dockerfile -d 'Name with or without path of the custom Dockerfile. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l build-arg -d 'build arg for docker build'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l kubernetes-folder -s k -d 'specify a project kubernetes folder to load comma separated merged Harness config for deployment'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l watch -d 'watch the status of the rollout until it reaches the target step'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l dry-run -d 'dry-run of rollout'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l skip-image-presence-check -d 'skip checking image presence in artifactory'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l skip-git-tag -d 'skip creating git tag for rollout'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout" -l no-dependency-registration -d 'don\'t attempt to register dependencies with Service Directory before the rollout'
complete -c bk -n "__fish_is_nth_token 1" -d 'Patch running pod(s) with a new image' -kxa "deploy:rollout:update"
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l environment -s e -d 'environment you want to configure against, e.g.: dev, dqs, or prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l installation -s i -d 'installation name you would like to deploy' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l image-url -d 'use a specific docker image, implies no-build'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l no-build -d 'skip docker build in dev'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l always-build -d 'force docker build in dqs and prod'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l pull-image -d 'attempt to pull a newer version of the base image before building'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l no-input -d 'error or make an assumption if we would ask for input'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l perl -d 'do some automatic stuff if you\'re a Perl application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l java -d 'do some automatic stuff if you\'re a Java application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l nodejs -d 'do some automatic stuff if you\'re a NodeJs application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l generic -d 'avoid any automatic stuff, since you\'re a generic application'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l app-yaml -d 'path to an harnessconfig.yaml (default: ./kubernetes/harnessconfig-$env[-$installationTag].yaml)'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l check-dot-deploy -d 'check the existence of .deploy file in the image and validate the file'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l dot-deploy-check-dir -d 'directory where a check for .deploy file will be performed'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l dot-deploy-auto-generation -d 'choose how we generate a .deploy for your image. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l dockerfile -d 'Name with or without path of the custom Dockerfile. Available values:'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l build-arg -d 'build arg for docker build'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l kubernetes-folder -s k -d 'specify a project kubernetes folder to load comma separated merged Harness config for deployment'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l watch -d 'watch the status of the rollout until it reaches the target step'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l dry-run -d 'dry-run of rollout'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l skip-image-presence-check -d 'skip checking image presence in artifactory'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l pod-name -s p -d 'pod name to patch'
complete -c bk -n "__fish_seen_subcommand_from deploy:rollout:update" -l pod-count -s n -d 'number of pods to patch'
complete -c bk -n "__fish_is_nth_token 1" -d 'Interactively pick an SD project, component, installation and cluster with some optional defaults' -kxa "deploy:use"
complete -c bk -n "__fish_seen_subcommand_from deploy:use" -l project -s p -d 'SD project' -x -a "(__bk_autocomplete_project)"
complete -c bk -n "__fish_seen_subcommand_from deploy:use" -l component -s c -d 'SD component' -x -a "(__bk_autocomplete_component)"
complete -c bk -n "__fish_seen_subcommand_from deploy:use" -l installation -s i -d 'SD installation' -x -a "(__bk_autocomplete_installation)"
complete -c bk -n "__fish_seen_subcommand_from deploy:use" -l choose-component -d 'Keep the current project context, start the dialog from choosing a component'
complete -c bk -n "__fish_seen_subcommand_from deploy:use" -l choose-installation -d 'Keep the current project/component context, start the dialog from choosing an installation'
complete -c bk -n "__fish_seen_subcommand_from deploy:use" -l choose-cluster -d 'Keep the current project/component/installation context, choose only a cluster'
complete -c bk -n "__fish_is_nth_token 1" -d 'bootstrap a new plugin or library inside the bk monorepo' -kxa "packages:bootstrap"
complete -c bk -n "__fish_seen_subcommand_from packages:bootstrap" -l name -r -s n -d 'name of the package'
complete -c bk -n "__fish_seen_subcommand_from packages:bootstrap" -l description -s d -d 'description of the package (not required for libraries)'
complete -c bk -n "__fish_seen_subcommand_from packages:bootstrap" -l is-discoverable -d 'whether or not the plugin will be displayed by `bk plugins:discover` command'
complete -c bk -n "__fish_seen_subcommand_from packages:bootstrap" -l owner -d 'plugin owner name'
complete -c bk -n "__fish_seen_subcommand_from packages:bootstrap" -l bk-root -r -s r -d 'root of the bk monorepo git project'
complete -c bk -n "__fish_seen_subcommand_from packages:bootstrap" -l type -r -s t -d 'wether to create a plugin or a library' -x -a "plugin library"
complete -c bk -n "__fish_is_nth_token 1" -d 'adds one or multiple dependencies by name to the specified plugin/library BUILD.bazel file' -kxa "packages:dependencies:add"
complete -c bk -n "__fish_seen_subcommand_from packages:dependencies:add" -l bazel-label -r -s l -d 'Bazel label of your plugin, e.g. //packages/plugins/shipper'
complete -c bk -n "__fish_seen_subcommand_from packages:dependencies:add" -l bk-root -r -s r -d 'root of the bk monorepo git project'
complete -c bk -n "__fish_seen_subcommand_from packages:dependencies:add" -l dependency-name -r -s d -d 'dependency name to add, could be specified multiple time'
complete -c bk -n "__fish_seen_subcommand_from packages:dependencies:add" -l type -r -s t -d 'type of dependencies we are adding' -x -a "internal external external-dev"
complete -c bk -n "__fish_is_nth_token 1" -d 'open Grafana dashboard of a particular plugin or ownership domain' -kxa "packages:metrics:dashboard"
complete -c bk -n "__fish_seen_subcommand_from packages:metrics:dashboard" -l plugin -d 'plugin name of the dashboard we want to open'
complete -c bk -n "__fish_seen_subcommand_from packages:metrics:dashboard" -l owner -d 'orgunit_id of the owner of the dashboard we want to open'
complete -c bk -n "__fish_is_nth_token 1" -d 'Calculates next tag and opens Gitlab UI to create the new tag on the correct commit hash.' -kxa "packages:tag"
complete -c bk -n "__fish_seen_subcommand_from packages:tag" -l bk-root -r -s r -d 'root of the bk monorepo git project'
complete -c bk -n "__fish_seen_subcommand_from packages:tag" -l name -r -s n -d 'name of the plugin of which to check the next tag'
complete -c bk -n "__fish_seen_subcommand_from packages:tag" -l channel -r -s c -d 'the channel on which to set the minimal version' -x -a "latest alpha"
complete -c bk -n "__fish_seen_subcommand_from packages:tag" -l release-type -r -s t -d 'type of release you want to make' -x -a "patch minor major prepatch preminor premajor prerelease"
complete -c bk -n "__fish_seen_subcommand_from packages:tag" -l remote -d 'git remote to use'
complete -c bk -n "__fish_seen_subcommand_from packages:tag" -l branch -s b -d 'git remote branch name to use. If not specified it will be inferred from the git status. It should not include the remote name, e.g. "master" not "origin/master"'
complete -c bk -n "__fish_is_nth_token 1" -d 'set the minimum version to check against during a version check' -kxa "packages:versions:set-minimum"
complete -c bk -n "__fish_seen_subcommand_from packages:versions:set-minimum" -l bk-root -r -s r -d 'root of the bk monorepo git project'
complete -c bk -n "__fish_seen_subcommand_from packages:versions:set-minimum" -l name -r -s n -d 'name of the plugin of which to set the minimum required version'
complete -c bk -n "__fish_seen_subcommand_from packages:versions:set-minimum" -l reason -r -d 'reason why this version needs to be the minimum one'
complete -c bk -n "__fish_seen_subcommand_from packages:versions:set-minimum" -l version -r -s v -d 'the minimum version user should have installed on their machine'
complete -c bk -n "__fish_seen_subcommand_from packages:versions:set-minimum" -l channel -s c -d 'the channel on which to set the minimal version, will be defaulted to \'latest\' for plugins or \'stable\' for `bk`'
complete -c bk -n "__fish_seen_subcommand_from packages:versions:set-minimum" -l version-configuration-file -d 'configuration file of version-checker that holds minimum versions, relative to flags \'--bk-root\''
complete -c bk -n "__fish_is_nth_token 1" -d 'a simplified version of `bk plugins:link` for Bazel setup' -kxa "plugins:link-bazel"
complete -c bk -n "__fish_seen_subcommand_from plugins:link-bazel" -l verbose -s v
complete -c bk -n "__fish_seen_subcommand_from plugins:link-bazel" -l bk-root -s r -d 'root of the bk monorepo git project'
complete -c bk -n "__fish_seen_subcommand_from plugins:link-bazel" -l plugin-name -s n -d 'link a plugin by name'
complete -c bk -n "__fish_is_nth_token 1" -d 'list installed plugins' -kxa "plugins"
complete -c bk -n "__fish_seen_subcommand_from plugins" -l core -d 'show core plugins'
complete -c bk -n "__fish_is_nth_token 1" -d 'displays installation properties of a plugin' -kxa "plugins:inspect"
complete -c bk -n "__fish_seen_subcommand_from plugins:inspect" -l help -s h -d 'show CLI help'
complete -c bk -n "__fish_seen_subcommand_from plugins:inspect" -l verbose -s v
complete -c bk -n "__fish_is_nth_token 1" -d 'installs a plugin into the CLI' -kxa "$__bk_command_group_plugins_install"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_plugins_install" -l help -s h -d 'show CLI help'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_plugins_install" -l verbose -s v
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_plugins_install" -l force -s f -d 'yarn install with force flag'
complete -c bk -n "__fish_is_nth_token 1" -d 'links a plugin into the CLI for development' -kxa "plugins:link"
complete -c bk -n "__fish_seen_subcommand_from plugins:link" -l help -s h -d 'show CLI help'
complete -c bk -n "__fish_seen_subcommand_from plugins:link" -l verbose -s v
complete -c bk -n "__fish_is_nth_token 1" -d 'removes a plugin from the CLI' -kxa "$__bk_command_group_plugins_uninstall"
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_plugins_uninstall" -l help -s h -d 'show CLI help'
complete -c bk -n "__fish_seen_subcommand_from $__bk_command_group_plugins_uninstall" -l verbose -s v
complete -c bk -n "__fish_is_nth_token 1" -d 'update installed plugins' -kxa "plugins:update"
complete -c bk -n "__fish_seen_subcommand_from plugins:update" -l help -s h -d 'show CLI help'
complete -c bk -n "__fish_seen_subcommand_from plugins:update" -l verbose -s v
