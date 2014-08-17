#
# base configured server with puppet post setup
#
box      = 'vagrant-puppet'
#url      = 'http://satserve.staples.com/pub/vagrant/vagrant-puppet.box'
hostname = 'puppet-test'
domain   = 'staples.com'
ram      = '2048'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = box
  #config.vm.box_url = url
  config.vm.network "public_network"
  config.vm.host_name = hostname + '.' + domain
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      "modifyvm", :id,
      "--name", hostname,
      "--memory", ram
    ]
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end
end
