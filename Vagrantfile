# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.5.0'

Vagrant.configure("2") do |config|
  config.vm.hostname = 'foxtail-cookbook-berkshelf'
  config.vm.box = 'chef/ubuntu-14.04'
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.boot_timeout = 120
  config.berkshelf.enabled = true
  config.omnibus.chef_version = 'latest'

  config.vm.provision :chef_solo do |chef|
    chef.json = { 
      "apache" => {
        "default_site_enabled" => true,
        "listen_ports" => ["8080"],
        "server_name" => 'site.foxtail.com',
        "mpm" => 'prefork'
      }
    }

    chef.run_list = [
      'recipe[foxtail-cookbook::default]'
    ]
  end
end
