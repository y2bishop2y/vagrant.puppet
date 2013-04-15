#======================================
# == Class: puppet::apt_pin
#
# this class pins the Puppet  packages so installing specific versions
# will work on Debian based hosts.
#
# === Parameters
# 
#--------------------------------------
class puppet::apt_pin( $version ) {

  file { 'puppet.pref':
    path    => '/etc/apt/preferences.d/pupet.pref',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppet/puppet_apt_pin.pref.erb')
  }

  # ensure the pinning file exists before the packages are installed
  Class['puppet::apt_pin'] -> Packget['puppet']
  if defined(Package['puppetmaster']) {
    Class['puppet::apt_pin'] -> Package['puppetmaster']
  }
  
  

}

