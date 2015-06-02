
# Vagrant (=rubi DSL) file that will setup some machines that can build a cluster
# based on Mesos and Marathon like components

Vagrant.require_version ">= 1.6.0"



# Defaults for config options defined in CONFIG
$share_home = false
$vm_gui = false
$vm_memory = 1024
$vm_cpus = 1
$shared_folders = {}

def vm_memory
  $vb_memory.nil? ? $vm_memory : $vb_memory
end

def vm_cpus
  $vb_cpus.nil? ? $vm_cpus : $vb_cpus
end

Vagrant.configure("2") do |config|
  
  config.ssh.insert_key = false
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.functional_vboxsf     = false
  end



  config.vm.define vm_name = "Jesus" do |config|
    config.vm.hostname = vm_name

    config.vm.provider :virtualbox do |vb|
      vb.gui = vm_gui
      vb.memory = vm_memory
      vb.cpus = vm_cpus
    end

    ip = "192.0.1.101"      
    config.vm.network :private_network, ip: ip
    config.vm.network "forwarded_port", guest: 5984, host: 5985
    config.vm.network "forwarded_port", guest: 5999, host: 5999
    config.vm.network "forwarded_port", guest: 5672, host: 5673
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.synced_folder ".", "/vagrant", disabled: true 

    if Vagrant::Util::Platform.windows?
      config.vm.provision "shell", path: "provision.sh" 
    end
  end


end
