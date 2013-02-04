Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :hostonly, '192.168.3.15'
  config.vm.customize ["modifyvm", :id, "--memory", 1024]

  # Default user/group id for vagrant in precise32
  host_user_id = 1000
  host_group_id = 1000

  if RUBY_PLATFORM =~ /linux|darwin/
    #config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
    config.vm.share_folder "v-root", "/vagrant", "."
    config.vm.share_folder "projects", "~/projects", "~/projects"
    config.vm.share_folder "dotfiles", "~/.zshkit", "~/.zshkit"

    host_user_id = Process.euid
    host_group_id = Process.egid
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']

    chef.add_recipe('rvm::vagrant')
    chef.add_recipe('rvm::user')

    chef.add_recipe('postgresql::server')
    chef.add_recipe('postgresql::ruby')

    chef.add_recipe('phantomjs')

    # This is where all the magic happens.
    # see site-cookbooks/gitlab/
    chef.add_recipe('rails::default')

    chef.json = {
      :rvm => {
        :user_installs => [
          { :user         => 'vagrant',
            :default_ruby => '1.9.3-p372'
          }
        ],
        :vagrant => {
          :system_chef_solo => '/opt/vagrant_ruby/bin/chef-solo'
        },
        :global_gems => [{ :name => 'bundler'}]
      },
      :postgresql => {
        :password => {
          :postgres => 'sad'
        }
      }
    }
  end
end
