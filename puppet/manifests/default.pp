
#
# site.pp defines defaults for vagrant provisioning
#

# user run stages for minor vagrant environment fixes

stage { 'pre': before => Stage['main'] }

class { 'mirrors' : stage => 'pre' }
class { 'vagrant' : stage => 'pre' }

class { 'puppet': }
class { 'networking': }
# class { 'emacs': }

if $hostname == 'master' {

  class { 'puppet::server': }
}
