# terraform-sentry-project
Terraform module which creates a sentry project

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_sentry"></a> [sentry](#requirement\_sentry) | >= 0.11.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sentry"></a> [sentry](#provider\_sentry) | >= 0.11.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | justtrackio/label/null | 0.26.0 |

## Resources

| Name | Type |
|------|------|
| [sentry_issue_alert.default](https://registry.terraform.io/providers/jianyuan/sentry/latest/docs/resources/issue_alert) | resource |
| [sentry_key.default](https://registry.terraform.io/providers/jianyuan/sentry/latest/docs/resources/key) | resource |
| [sentry_plugin.webhook](https://registry.terraform.io/providers/jianyuan/sentry/latest/docs/resources/plugin) | resource |
| [sentry_project.default](https://registry.terraform.io/providers/jianyuan/sentry/latest/docs/resources/project) | resource |
| [sentry_organization.default](https://registry.terraform.io/providers/jianyuan/sentry/latest/docs/data-sources/organization) | data source |
| [sentry_team.default](https://registry.terraform.io/providers/jianyuan/sentry/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br/>This is for some rare cases where resources want additional configuration of tags<br/>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_alarm_action_match"></a> [alarm\_action\_match](#input\_alarm\_action\_match) | Trigger actions when an event is captured by Sentry and `any` or `all` of the specified conditions happen. | `string` | `"any"` | no |
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | List of actions. In JSON string format. | `string` | `"[]"` | no |
| <a name="input_alarm_conditions"></a> [alarm\_conditions](#input\_alarm\_conditions) | List of conditions. In JSON string format. | `string` | `"[]"` | no |
| <a name="input_alarm_enabled"></a> [alarm\_enabled](#input\_alarm\_enabled) | Defines if alarms should be created | `bool` | `true` | no |
| <a name="input_alarm_filter_match"></a> [alarm\_filter\_match](#input\_alarm\_filter\_match) | A string determining which filters need to be true before any actions take place. Required when a value is provided for filters. | `string` | `null` | no |
| <a name="input_alarm_filters"></a> [alarm\_filters](#input\_alarm\_filters) | A list of filters that determine if a rule fires after the necessary conditions have been met. In JSON string format. | `string` | `null` | no |
| <a name="input_alarm_frequency"></a> [alarm\_frequency](#input\_alarm\_frequency) | Perform actions at most once every X minutes for this issue. | `number` | `5` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br/>in the order they appear in the list. New attributes are appended to the<br/>end of the list. The elements of the list are joined by the `delimiter`<br/>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account id | `string` | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br/>See description of individual variables for details.<br/>Leave string and numeric variables as `null` to use default value.<br/>Individual variable settings (non-null) override settings in context object,<br/>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br/>  "additional_tag_map": {},<br/>  "attributes": [],<br/>  "delimiter": null,<br/>  "descriptor_formats": {},<br/>  "enabled": true,<br/>  "environment": null,<br/>  "id_length_limit": null,<br/>  "label_key_case": null,<br/>  "label_order": [],<br/>  "label_value_case": null,<br/>  "labels_as_tags": [<br/>    "unset"<br/>  ],<br/>  "name": null,<br/>  "namespace": null,<br/>  "regex_replace_chars": null,<br/>  "stage": null,<br/>  "tags": {},<br/>  "tenant": null<br/>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br/>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br/>Map of maps. Keys are names of descriptors. Values are maps of the form<br/>`{<br/>   format = string<br/>   labels = list(string)<br/>}`<br/>(Type is `any` so the map values can later be enhanced to provide additional options.)<br/>`format` is a Terraform format string to be passed to the `format()` function.<br/>`labels` is a list of labels, in order, to pass to `format()` function.<br/>Label values will be normalized before being passed to `format()` so they will be<br/>identical to how they appear in `id`.<br/>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br/>Set to `0` for unlimited length.<br/>Set to `null` for keep the existing setting, which defaults to `0`.<br/>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br/>Does not affect keys of tags passed in via the `tags` input.<br/>Possible values: `lower`, `title`, `upper`.<br/>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br/>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br/>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br/>set as tag values, and output by this module individually.<br/>Does not affect values of tags passed in via the `tags` input.<br/>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br/>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br/>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br/>Default is to include all labels.<br/>Tags with empty values will not be included in the `tags` output.<br/>Set to `[]` to suppress all generated tags.<br/>**Notes:**<br/>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br/>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br/>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br/>  "default"<br/>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br/>This is the only ID element not also included as a `tag`.<br/>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_organization_slug"></a> [organization\_slug](#input\_organization\_slug) | The unique URL slug for this organization. | `string` | `"sentry"` | no |
| <a name="input_organizational_unit"></a> [organizational\_unit](#input\_organizational\_unit) | Usually used to indicate the AWS organizational unit, e.g. 'prod', 'sdlc' | `string` | `null` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | The optional platform for this project. | `string` | `"go"` | no |
| <a name="input_rate_limit_count"></a> [rate\_limit\_count](#input\_rate\_limit\_count) | Number of events that can be reported within the rate limit window. | `number` | `100` | no |
| <a name="input_rate_limit_window"></a> [rate\_limit\_window](#input\_rate\_limit\_window) | Length of time that will be considered when checking the rate limit. | `number` | `60` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br/>Characters matching the regex will be removed from the ID elements.<br/>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_resolve_age"></a> [resolve\_age](#input\_resolve\_age) | Hours in which an issue is automatically resolve if not seen after this amount of time. | `number` | `720` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br/>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_team_slug"></a> [team\_slug](#input\_team\_slug) | The unique team slug. | `string` | `"sentry"` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_webhook_url"></a> [webhook\_url](#input\_webhook\_url) | Newline seperated list of URLs for the webhook plugin. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dsn"></a> [dsn](#output\_dsn) | DSN for the key |
<!-- END_TF_DOCS -->
