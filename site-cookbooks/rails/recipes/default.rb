#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"

package 'imagemagick'
package 'nginx'
package 'htop'
package 'vim'

postgresql_connexion = { :host     => 'localhost',
                         :username => 'postgres',
                         :password => node['postgresql']['password']['postgres'] }

postgresql_database_user 'vagrant' do
  connection postgresql_connexion
  password 'vagrant'
  role_attributes :superuser => true, :createdb => true
  action :create
end

# Append default Display (99.0) in bashrc
template "/etc/bash.bashrc" do
  owner "root"
  group "root"
  mode 0755
  source "bash.bashrc"
  action :create_if_missing
end

template "/home/vagrant/.gitconfig" do
  source "git.erb"
  owner "vagrant"
  group "vagrant"
  action :create_if_missing
end
