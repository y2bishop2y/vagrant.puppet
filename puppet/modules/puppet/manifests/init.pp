#======================================
# == Class: puppet
#
# This class installs and manages the Puppet client daemon.
#
# === Parameters
# 
#--------------------------------------
class puppet( $ensure = $puppet::params::client_ensure ) inherits puppet::params {

  if $osfamily == 'debian' and $ensure != 'latest' {
    class { 'puppet::apt_pin':
      version => $ensure
    }
  }

  package { 'puppet':
    ensure => $ensure,
  }

  # required to start client agent on ubuntu
  exec { 'start_puppet':
    command => '/bin/sed -i /etc/default/puppet -e "s/START=no/START=yes/"',
    onlyif  => '/usr/bin/test -f /etc/default/puppet',
    require => Package[ 'puppet' ],
    before  => Service[ 'puppet' ],

  }

  service { 'puppet':
    enable  => true,
    ensure  => running,
    require => Package[ 'puppet' ],

  }
}
  
