#
# nodes.pp defines all puppet nodes
#

# Self manage the puppet master server

node 'master' {
  class {'dashboard':
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

#### CLIENTS

node 'client10' {
  class { 'helloworld' }
}

node 'client20'  { }
