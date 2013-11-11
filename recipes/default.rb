include_recipe "apt" # apt should be run first

node['workvm']['packages'].each do |pkg|
  package pkg
end

%w{ zsh }.each do |requirement|
  include_recipe requirement
end

dotfiles_dir = "#{node[:workvm][:home]}/.dotfiles"

execute "Download .dotfiles" do
  user node[:workvm][:user]
  group node[:workvm][:user]

  command "git clone https://github.com/Andrew8xx8/dotfiles.git #{node[:workvm][:home]}/.dotfiles"
  not_if { ::File.exists?("#{dotfiles_dir}/.git") }
end

execute "Updating .dotfiles" do
  user node[:workvm][:user]
  group node[:workvm][:user]

  command "cd #{node[:workvm][:home]}/.dotfiles && git pull --force"
  only_if { ::File.exists?("#{dotfiles_dir}/.git") }
end

rvm_shell "Install .dotfiles" do
  ruby_string node[:workvm][:ruby]
  user        node[:workvm][:user]
  group       node[:workvm][:user]
  cwd         dotfiles_dir
  code        %{rake install[#{node[:workvm][:email]},#{node[:workvm][:fullname]}]}
end

execute "change shell" do
  command "chsh #{node[:workvm][:user]} -s /bin/zsh"
end
