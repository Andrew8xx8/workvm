#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'imagemagick'
package 'nginx'
package 'htop'

gem_package 'thin'
gem_package 'rainbows'
gem_package 'sendfile'

postgresql_connexion = { :host     => 'localhost',
                         :username => 'postgres',
                         :password => node['postgresql']['password']['postgres'] }

postgresql_database_user 'vagrant' do
  connection postgresql_connexion
  password 'vagrant'
  action :create
end
