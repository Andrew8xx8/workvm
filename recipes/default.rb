include_recipe "apt" # apt should be run first

node['workvm']['packages'].each do |pkg|
  package pkg
end

%w{ zsh }.each do |requirement|
  include_recipe requirement
end

execute "Download .dotfiles" do
  command "git clone git@github.com:Andrew8xx8/dotfiles.git ~/.dotfiles"
end

execute "Install .dotfiles" do
  command "cd ~/.dotfiles && rake install[#{node[:workvm][:email]},#{node[:workvm][:fullname]}]"
end

execute "change shell" do
  command "chsh #{node[:workvm][:user]} -s /bin/zsh"
end
