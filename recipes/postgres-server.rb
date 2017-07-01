execute "locale stuffs" do
  command "localedef -i en_US -f UTF-8 en_US.UTF8"
end

include_recipe "postgresql::server"
