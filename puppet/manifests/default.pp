
#
# site.pp defines defaults for vagrant provisioning
#

# user run stages for minor vagrant environment fixes

stage { 'pre': before => Stage['main'] }

class { 'mirrors' : stage => 'pre' }
class { 'vagrant' : stage => 'pre' }

class { 'puppet': }
class { 'networking': }
class { 'tree': }

if $hostname == 'master' {

  # class { 'mysql': }
  # class { 'mysql::ruby': }
  # class { 'mysql::server': }
  class { 'emacs': }
  class { 'puppet::server': }

  class { 'dashboard': 
    dashboard_ensure          => 'present',
    dashboard_user            => 'puppet-dbuser',
    dashboard_group           => 'puppet-dbgroup',
    dashboard_password        => 'changeme',
    dashboard_db              => 'dashboard_prod',
    dashboard_charset         => 'utf8',
    dashboard_site            => $fqdn,
    dashboard_port            => '8080',
    mysql_root_pw             => 'changemetoo',
    passenger                 => true,
    }
}
