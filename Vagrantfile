servers=[
      {
        :hostname => "kubernetes01",
        :ip => "192.168.100.10",
        :box => "ubuntu/bionic64",
        :ram => 2048,
        :cpu => 1,
        :provision_shell => "kubernetes01-provision.sh"
      },
      {
        :hostname => "kubernetes02",
        :ip => "192.168.100.11",
        :box => "ubuntu/bionic64",
        :ram => 2048,
        :cpu => 1,
        :provision_shell => "kubernetes02-provision.sh"
      },
#      {
#        :hostname => "kubernetes03",
#        :ip => "192.168.100.12",
#        :box => "ubuntu/bionic64",
#        :ram => 2048,
#        :cpu => 1,
#        :provision_shell => "kubernetes03-provision.sh"
#      }

    ]

Vagrant.configure(2) do |config|
    servers.each do |machine|
	      config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network "private_network", ip: machine[:ip]
            node.vm.provision "shell", path: machine[:provision_shell]
            node.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
                end
            end
        end
  end
