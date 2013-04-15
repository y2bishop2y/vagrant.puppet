#======================================
# == Class: networking
#
# This class configures the hosts file to allow communication between the
# puppet master and puppet clients using the VirutalBox host-only network.
# 
#--------------------------------------
class networking {

  file { '/etc/hosts':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('networking/hosts.erb'),
  }
}
