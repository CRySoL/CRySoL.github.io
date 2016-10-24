# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "deb/jessie-i386"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

end
