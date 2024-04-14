# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  (10..11).each do |i|
    config.vm.define "windows#{i}" do |node|
      node.vm.box = "gusztavvargadr/windows-#{i}"
      # node.vm.box_version = (i == 10) ? "2202.0.2403" : "2302.0.2403"
      node.vm.guest = :windows
      node.vm.boot_timeout = 600
      node.vm.synced_folder "build/", "/home/vagrant/build", create: true

      node.vm.provider "virtualbox" do |v|
        v.gui = true
        v.name = "VimeCheckify Windows#{i}"
        v.memory = 4096
        v.cpus = 2
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        v.customize ["modifyvm", :id, "--draganddrop", "hosttoguest"]
      end
      
      node.vm.provision "install-winget-#{i}", type: "shell", before: :all, path: "install-winget-#{i}.ps1", reset: true
      node.vm.provision "setup-python-git", type: "shell", path: "setup-python-git.ps1", reset: true
      node.vm.provision "run-vimeworld", type: "shell", after: "setup-python-git", path: "run-vimeworld.ps1"
      node.vm.provision "run-vimecheckify", type: "shell", after: :all, path: "run-vimecheckify.ps1"
    end
  end
end
