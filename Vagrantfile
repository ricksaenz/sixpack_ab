# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "sixpack-ab-berkshelf"

  config.omnibus.chef_version = :latest

  config.vm.box = "chef/centos-6.5"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 5001, host: 5001
  config.vm.network "forwarded_port", guest: 6379, host: 6379

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      sixpack_ab: {
        repo: 'git://github.com/ricksaenz/sixpack.git',
        branch: 'master'
      }
    }

    chef.run_list = [
        "recipe[sixpack_ab::default]"
    ]
  end
end
