apt_update "..."

include_recipe "locale::default"
include_recipe "postgres-chef::postgres-server"
include_recipe "postgres-chef::postgres-admin"
