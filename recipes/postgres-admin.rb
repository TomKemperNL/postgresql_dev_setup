python_runtime '3'

remote_file "/home/vagrant/pgadmin4-1.5-py2.py3-none-any.whl" do
  source "https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v1.5/pip/pgadmin4-1.5-py2.py3-none-any.whl"
  notifies :run, "execute[install_pgadmin]", :immediately
end

execute "install_pgadmin" do
  user "root"
  action :nothing
  command "pip3 install /home/vagrant/pgadmin4-1.5-py2.py3-none-any.whl"
end

file "/usr/local/lib/python3.5/dist-packages/pgadmin4/config_local.py" do
  content <<-CONTENT
DEFAULT_SERVER = '0.0.0.0'
SERVER_MODE = False
  CONTENT
end

poise_service "pgadmin" do
  command "/usr/bin/python3 /usr/local/lib/python3.5/dist-packages/pgadmin4/pgAdmin4.py"
end

package "sqlite3"
execute "add_local_db" do
  command "sqlite3 /root/.pgadmin/pgadmin4.db \"insert or replace into server(id, user_id, servergroup_id, name, host, port, maintenance_db, username, ssl_mode) values(1, 1,1,'Local', '127.0.0.1', 5432, 'postgres', 'postgres', 'prefer');\""
end
