output "id" {
  value       = { for k, v in tfe_registry_module.module_registry : k => v.id }
  description = "The ID of the registry module."
}

output "name" {
  value       = { for k, v in tfe_registry_module.module_registry : k => v.name }
  description = "The name of registry module."
}