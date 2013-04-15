#======================================
# == Class: mirrors
#
# This class laods the relevant distribution specific package repository
# manifests and would be the place to configure any other custom mirrors
# you want
# 
#--------------------------------------
class mirrors {

  case $::osfamily {

    'redhat': {
      class { 'mirrors::yum':}
    }
    'debian': {
      class { 'mirrors::apt': }
    }

    default: {
      fail("module '${module_name}' is not currently supported by Puppet Sandbox on ${::operatingsystem}")
    }
  }

}
