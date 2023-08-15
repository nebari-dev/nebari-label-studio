output "config" {
  description = "Configuration credentials for connecting to openid client"
  value = {
    enabled       = local.auth_enabled
    client_id     = local.auth_enabled ? keycloak_openid_client.this[0].client_id : ""
    issuer_url    = "${local.external_url}realms/${local.realm_id}"
    discovery_url = "${local.external_url}realms/${local.realm_id}/.well-known/openid-configuration"
    auth_url      = "${local.external_url}realms/${local.realm_id}/protocol/openid-connect/auth"
    token_url     = "${local.external_url}realms/${local.realm_id}/protocol/openid-connect/token"
    jwks_url      = "${local.external_url}realms/${local.realm_id}/protocol/openid-connect/certs"
    logout_url    = "${local.external_url}realms/${local.realm_id}/protocol/openid-connect/logout"
    userinfo_url  = "${local.external_url}realms/${local.realm_id}/protocol/openid-connect/userinfo"
  }
  sensitive = false
}
