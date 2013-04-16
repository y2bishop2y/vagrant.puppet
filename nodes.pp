#
# nodes.pp defines all puppet nodes
#

# Self manage the puppet master server

node 'master' { }
# node 'puppet' { }

#### CLIENTS

node 'client10' {
  class { 'helloworld': }
}

node 'client20'  { }
