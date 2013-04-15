

#======================================
# This class manages the Puppet parameters
#--------------------------------------
class puppet::params {

  $client_ensure = 'latest'
  $server_esnure = 'latest'

  case $::osfamily {

    'redhat' : {
      $server_package_name = 'puppet-server'
    }
    'debian' : {
      $server_package_name = 'puppetmaster'
    }
    default : {
      fail("Module 'puppet' is not currently supported by Puppet sandbox on ${::operatingsystem} ")
    }

  }

}


