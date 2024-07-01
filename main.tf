resource "tfe_oauth_client" "gh_oauth" {
  organization     = var.tfe_org
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.gh_oauth_token
  service_provider = "github"
}

resource "tfe_registry_module" "module_registry" {
  for_each     = var.modules_registry
  name         = each.key
  organization = var.tfe_org
  vcs_repo {
    display_identifier         = each.value.repo_identifier
    identifier                 = each.value.repo_identifier
    oauth_token_id             = tfe_oauth_client.gh_oauth.oauth_token_id
    branch                     = each.value.repo_branch
    github_app_installation_id = each.value.ghe_installation_id
    tags                       = each.value.tags
  }
}




