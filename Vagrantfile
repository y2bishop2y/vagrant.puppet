# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = "example.com"

puppet_nodes = 
  [
   {:hostname => 'master',   :ip => '192.168.2.10', :box => 'precise64', :fwdhost => 8140, :fwdguest => 8140, :ram => 512},
   {:hostname => 'client10', :ip => '192.168.2.11', :box => 'precise64'},
   {:hostname => 'client20', :ip => '192.168.2.12', :box => 'precise64'},
]


Vagrant.configure("2") do |config|

  puppet_nodes.each do |node|

    config.vm.define node[:hostname] do |node_config|

      node_config.vm.box      = node[:box]
      node_config.vm.box_url  = 'http://files.vagrantup.com/' + node_config.vm.box + '.box'
      node_config.vm.hostname = node[:hostname] + '.' + domain
      node_config.vm.network  :private_network, ip: node[:ip]


      if node[:fwdhost]
        node_config.vm.network :forwarded_port, guest: node[:fwdguest], host: node[:fwdhost]
      end

      memory = node[:ram] ? node[:ram] : 256;

      node_config.vm.provider :virtualbox do |vb|
        vb.customize [
                     'modifyvm', :id,
                     '--name', node[:hostname],
                     '--memory', memory.to_s
                    ]
      end
      
      node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path    = 'puppet/modules'
      
      end

    end
  end

end
