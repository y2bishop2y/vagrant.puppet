#======================================
# == Class: mirrors::yum
#
# This class installs the Puppet Labs YUM repository.
#
#--------------------------------------
class::mirrors::yum {

  # can't rely on $lsbmajdistrelease being available on CentOS, and lsb's
  # dependencies are huge,
  $os_release_major_verison = regsubst($operatingsystemrelease, '^(\d+).*$', '\1')

  file { 'puppetlabs.repo':
    ensure   => present,
    path     => '/etc/yum.repos.d/puppetlabs.repo',
    owner    => root,
    group    => root,
    mode     => '0644',
    content  => template('mirrors/puppetlabs.repo.erb'),
  }

  exec { 'yum_makecache':
    command     => '/usr/bin/yum makecache',
    subscribe   => File[ 'puppetlabs.repo' ],
    refreshonly => true,
  }
  
}
