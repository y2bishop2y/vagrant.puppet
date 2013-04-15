#======================================
# == Class: puppet::server
# 
# This class installs and manages the Puppet server daemon.
#
# === Parameters

#--------------------------------------

class puppet::server(
  $ensure       = $puppet::params::server_ensure,
  $package_name = $puppet::params::server_package_name ) inherits puppet::params {

    # required to prevent syslog error on ubuntu
    # https://bugs.launchpad.net/ubuntu/+source/puppet/+bug/564861
    file { [ '/etc/puppet', '/etc/puppet/files']:
      ensure => directory,
      before => Package['puppetmaster'],
    }

    package { 'puppetmaster':
      ensure => $ensure,
      name   => $package_name,
    }

    package { 'puppet-lint':
      ensure   => latest,
      provider => gem,
    }

    file { 'puppet.conf':
      path    => '/etc/puppet/puppet.conf',
      owner   => 'puppet',
      group   => 'puppet',
      mode    => '0644',
      source  => 'puppet:///modules/puppet/puppet.conf',
      require => Package[ 'puppetmaster' ],
      notify  => Service[ 'puppetmaster' ],
    }

    file { 'site.pp':
      path    => '/etc/puppet/manifests/site.pp',
      owner   => 'puppet',
      group   => 'puppet',
      mode    => '0644',
      source  => 'puppet:///modules/puppet/site.pp',
      require => Package['puppetmaster'],
    }

    file { 'autosign.conf':
      path    => '/etc/puppet/autosign.conf',
      owner   => 'puppet',
      group   => 'puppet',
      mode    => '0644',
      content => '*',
      require => Package[ 'puppetmaster' ],
    }

    file { '/etc/puppet/manifests/nodes.pp':
      ensure  => link,
      target  => '/vagrant/nodes.pp',
      require => Package[ 'puppetmaster' ],
    }

    # initialize a template file then ignore
    file { '/vagrant/nodes.pp':
      ensure  => present,
      replace => false,
      source  => 'puppet:///modules/puppet/nodes.pp',
    }

    service { 'puppetmaster':
      enable => true,
      ensure => running,
    }
    
}