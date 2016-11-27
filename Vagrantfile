# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "trusty64"
    config.vm.provision :shell, :path => "vm_provision/provision-ubuntu-14.04.sh"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.network :private_network, ip: "192.168.33.10"

    config.vm.provider "virtualbox" do |vb|
        vb.customize [
            "modifyvm", :id,
            "--cpus", "1",
            "--memory", "1024",
            "--cpuexecutioncap", "50"
        ]
        vb.name = "pi-dev"
        vb.gui = false
    end
end
