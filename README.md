Description
===========


Puppet Sandobox is a multi VM [Vagrant](http://vagrantup.com)-based puppet 
development environment used for creating and testing new moduels outside 
of your produciton enviorment.  

Puppet Sandbox will set up three separate virtual machines:

* _puppet.example.com_ - the Puppet master server
* _client1.example.com_ - the first Puppet client machine
* _client2.example.com_ - the second Puppet client machine

These VMs can be used in conjunction to segregate and test your modules
based on node roles, Puppet environments, etc. You can even test modules
on different Linux distributions or release versions to better match your
production infrastructure.