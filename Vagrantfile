#!/usr/bin/env ruby

require 'vagrant-vbguest' unless defined? VagrantVbguest::Config

Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.customize ["modifyvm", :id, "--cpus", 1, "--memory", 512]
  # config.vm.network :hostonly, "33.33.33.11"
  config.vm.share_folder("v-root", "/vagrant", ".")
  config.vbguest.auto_update = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks']    
    chef.add_recipe 'installer'
  end

end