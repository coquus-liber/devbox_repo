Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # vb.name = "xenial"
    vb.memory = "2048"
    # vb.cpus = 2
    # v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]

    # vb.gui = true
    # vb.memory = "4096"
    # vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']

    # Add a virtual cd drive (for guest additions, etc)
    vb.customize ['storageattach', :id, 
      "--storagectl", "IDE Controller", 
      '--port', 1, 
      '--device', 0, 
      '--type', 'dvddrive',
      '--medium', 'emptydrive'] # 'additions' ?

  end
end 
